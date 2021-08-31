{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "desktop-vnc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper desktop image name
*/}}
{{- define "desktop-vnc.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Apache Docker Image Registry Secret Names
.Values.image .Values.desktop.extraTools.docker.image .Values.desktop.extraTools.kubectl.image .Values.desktop.extraTools.helm.image .Values.desktop.extraTools.aws.image .Values.desktop.extraTools.git.image .Values.desktop.extraTools.kind.image .Values.busybox.image
*/}}
{{- define "desktop-vnc.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image .Values.desktop.extraTools.docker.image .Values.desktop.extraTools.kubectl.image .Values.desktop.extraTools.helm.image .Values.desktop.extraTools.aws.image .Values.desktop.extraTools.git.image .Values.desktop.extraTools.kind.image .Values.busybox.image) "global" .Values.global) -}}
{{- end -}}
{{/*
Return the proper busybox image name
*/}}
{{- define "desktop-vnc.busyboxImage" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.busybox.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper podDockerDaemon image name
*/}}
{{- define "desktop-vnc.podDockerDaemonImage" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.podDockerDaemon.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper desktop.extraTools.docker image name
*/}}
{{- define "desktop-vnc.extraToolsDockerImage" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.desktop.extraTools.docker.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper desktop.extraTools.docker image name
*/}}
{{- define "desktop-vnc.extraToolsDockerComposeImage" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.desktop.extraTools.dockerCompose.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper desktop.extraTools.kubectl image name
*/}}
{{- define "desktop-vnc.extraToolsKubectlImage" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.desktop.extraTools.kubectl.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper desktop.extraTools.helm image name
*/}}
{{- define "desktop-vnc.extraToolsHelmImage" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.desktop.extraTools.helm.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper desktop.extraTools.aws image name
*/}}
{{- define "desktop-vnc.extraToolsAwsImage" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.desktop.extraTools.aws.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper desktop.extraTools.git image name
*/}}
{{- define "desktop-vnc.extraToolsGitImage" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.desktop.extraTools.git.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper desktop.extraTools.kind image name
*/}}
{{- define "desktop-vnc.extraToolsKindImage" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.desktop.extraTools.kind.image "global" .Values.global) -}}
{{- end -}}

{{/*
this will replace the string after the last "-" 
(.eg: abdou-desktop ... abdou)

*/}}

{{- define "desktop-vnc.fullname" -}}
{{- regexReplaceAll "-[^-]*$" .Release.Name "" }}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "desktop-vnc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "desktop-vnc.labels" -}}
app.kubernetes.io/name: {{ include "desktop-vnc.name" . }}
helm.sh/chart: {{ include "desktop-vnc.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

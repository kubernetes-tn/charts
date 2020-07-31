{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "desktop-vnc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
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

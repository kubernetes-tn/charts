# radius-auth-proxy helm chart

Chart for

# Examples :

**with required values**

```sh
 helm template rap tn/radius-auth-proxy \
  --set radiusServer.hostname=radius-server.auth \
  --set radiusClient.proxiedUrl=http://private-app.default/ \ --set radiusServer.secret=SfsQsd
```

**with custom login page**

Assuming you have the login page file under `./login.html` locally.

```sh
 helm template rap tn/radius-auth-proxy \
  --set radiusServer.hostname=radius-server.auth \
  --set radiusClient.proxiedUrl=http://private-app.default/ \ --set radiusServer.secret=SfsQsd \
  --set-file assets.loginHtml=./login.html
```
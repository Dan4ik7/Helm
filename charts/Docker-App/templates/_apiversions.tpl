{{/*
Return the target Kubernetes version
*/}}
{{- define "apiversion.capabilities.kubeVersion" -}}
{{- default (default .Capabilities.KubeVersion.Version .Values.kubeVersion) ((.Values.global).kubeVersion) -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for ingress.
*/}}
{{- define "apiversion.capabilities.ingress.apiVersion" -}}
{{- $kubeVersion := include "apiversion.capabilities.kubeVersion" . -}}
{{- if (.Values.ingress).apiVersion -}}
{{- .Values.ingress.apiVersion -}}
{{- else if and (not (empty $kubeVersion)) (semverCompare "<1.14-0" $kubeVersion) -}}
{{- print "extensions/v1beta1" -}}
{{- else if and (not (empty $kubeVersion)) (semverCompare "<1.19-0" $kubeVersion) -}}
{{- print "networking.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "networking.k8s.io/v1" -}}
{{- end }}
{{- end -}}

{{/*
Print "true" if the API pathType field is supported
Usage:
{{ include "apiversion.ingress.supportsPathType" . }}
*/}}
{{- define "apiversion.ingress.supportsPathType" -}}
{{- if (semverCompare "<1.18-0" (include "apiversion.capabilities.kubeVersion" .)) -}}
{{- print "false" -}}
{{- else -}}
{{- print "true" -}}
{{- end -}}
{{- end -}}


{{- define "apiversion.ingress.backend" -}}
{{- $apiVersion := (include "apiversion.capabilities.ingress.apiVersion" .context) -}}
{{- if or (eq $apiVersion "extensions/v1beta1") (eq $apiVersion "networking.k8s.io/v1beta1") -}}
serviceName: {{ .serviceName }}
servicePort: {{ .servicePort }}
{{- else -}}
service:
  name: {{ .serviceName }}
  port:
    {{- if typeIs "string" .servicePort }}
    name: {{ .servicePort }}
    {{- else if or (typeIs "int" .servicePort) (typeIs "float64" .servicePort) }}
    number: {{ .servicePort | int }}
    {{- end }}
{{- end -}}
{{- end -}}


{{/*
Returns true if the ingressClassname field is supported
Usage:
{{ include "apiversion.ingress.supportsIngressClassname" . }}
*/}}
{{- define "apiversion.ingress.supportsIngressClassname" -}}
{{- if semverCompare "<1.18-0" (include "apiversion.capabilities.kubeVersion" .) -}}
{{- print "false" -}}
{{- else -}}
{{- print "true" -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for deployment.
*/}}
{{- define "apiversion.capabilities.deployment.apiVersion" -}}
{{- $kubeVersion := include "apiversion.capabilities.kubeVersion" . -}}
{{- if and (not (empty $kubeVersion)) (semverCompare "<1.14-0" $kubeVersion) -}}
{{- print "extensions/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for statefulset.
*/}}
{{- define "apiversion.capabilities.statefulset.apiVersion" -}}
{{- $kubeVersion := include "apiversion.capabilities.kubeVersion" . -}}
{{- if and (not (empty $kubeVersion)) (semverCompare "<1.14-0" $kubeVersion) -}}
{{- print "apps/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}
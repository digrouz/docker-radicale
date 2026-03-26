{{/*
  Helm chart helper templates
*/}}

{{/* Generate chart name */}}
{{- define "helper.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Generate full release name */}}
{{- define "helper.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "helper.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Labels for resources */}}
{{- define "helper.labels" -}}
app.kubernetes.io/name: {{ include "helper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* Selector labels */}}
{{- define "helper.selectorLabels" -}}
app.kubernetes.io/name: {{ include "helper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "cloudreve.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cloudreve.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cloudreve.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | quote }}
{{ include "cloudreve.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cloudreve.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cloudreve.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
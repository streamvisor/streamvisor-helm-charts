{{/*
Expand the name of the chart
*/}}
{{- define "streamvisor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand the namespace of the chart
*/}}
{{- define "streamvisor.namespace" -}}
{{- default .Release.Namespace .Values.namespace  -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "streamvisor.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version used by the chart label
*/}}
{{- define "streamvisor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create standard labels
*/}}
{{- define "streamvisor.standardLabels" -}}
app: {{ template "streamvisor.name" . }}
chart: {{ template "streamvisor.chart" . }}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
{{- if .Values.labels }}
{{ .Values.labels | toYaml | trim }}
{{- end }}
{{- end }}

{{/*
Create template labels
*/}}
{{- define "streamvisor.template.labels" -}}
app: {{ template "streamvisor.name" . }}
release: {{ .Release.Name }}
{{- if .Values.labels }}
{{ .Values.labels | toYaml | trim }}
{{- end }}
{{- end }}

{{/*
Create match labels
*/}}
{{- define "streamvisor.matchLabels" -}}
app: {{ template "streamvisor.name" . }}
release: {{ .Release.Name }}
{{- end }}

{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mariadb-nodejs-broker.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mariadb-nodejs-broker.fullname" -}}
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


{{- define "broker.service" -}}
{{- printf "%s-%s" .Chart.Name .Release.Name -}}
{{- end -}}

{{- define "broker.url" -}}
{{- printf "%s-%s.%s" .Chart.Name .Release.Name .Release.Namespace -}}
{{- end -}}

{{- define "broker.name" -}}
{{- printf "%s-%s-broker" .Release.Name .Release.Namespace -}}
{{- end -}}

{{- define "broker.secret" -}}
{{- printf "%s-%s-secret" .Release.Name .Release.Namespace -}}
{{- end -}}

{{- define "mariadb.secret" -}}
{{- printf "%s-mariadb" .Release.Name -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mariadb-nodejs-broker.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "mariadb.host" -}}
  {{- if .Values.mariadb.service.host -}}
    {{ .Values.mariadb.service.host }}
  {{- else -}}
    {{- printf "%s-%s.%s" .Release.Name "mariadb-master" .Release.Namespace | trunc 63 | trimSuffix "-" -}}
  {{- end -}}
{{- end -}}
# Streamvisor Helm Chart
Helm chart for deploying Streamvisor on Kubernetes.

## Parameters

### Common parameters

Parameters shared among Streamvisor components

| Name               | Description                                                                                                | Value           |
| ------------------ | ---------------------------------------------------------------------------------------------------------- | --------------- |
| `nameOverride`     | String to partially override name                                                                          | `""`            |
| `fullnameOverride` | String to fully override name                                                                              | `""`            |
| `namespace`        | String to specify namespace to deploy in (if empty, defaults to .Release.Namespace (aka helm --namespace)) | `""`            |
| `clusterDomain`    | Kubernetes cluster domain name                                                                             | `cluster.local` |
| `labels`           | Custom labels to add to all components                                                                     | `{}`            |

### Streamvisor deployment parameters

Parameters for Streamvisor deployment

| Name                                   | Description                                                                              | Value                     |
| -------------------------------------- | ---------------------------------------------------------------------------------------- | ------------------------- |
| `deployment.image.repository`          | Streamvisor image repository                                                             | `streamvisor/streamvisor` |
| `deployment.image.tag`                 | Streamvisor image tag                                                                    | `latest`                  |
| `deployment.image.imagePullPolicy`     | Streamvisor imagePullPolicy                                                              | `Never`                   |
| `deployment.nodeSelector`              | Node labels for Streamvisor pod assignment                                               | `{}`                      |
| `deployment.annotations`               | Annotations for Streamvisor pod                                                          | `{}`                      |
| `deployment.tolerations`               | Tolerations for Streamvisor pod assignment                                               | `[]`                      |
| `deployment.gracePeriod`               | Seconds in which pod needs to terminate gracefully                                       | `30`                      |
| `deployment.resources.requests.memory` | Memory request for the Streamvisor pod                                                   | `1Gi`                     |
| `deployment.resources.requests.cpu`    | CPU request for the Streamvisor pod                                                      | `1000m`                   |
| `deployment.resources.limits.memory`   | Memory limit for the Streamvisor pod                                                     | `2Gi`                     |
| `deployment.resources.limits.cpu`      | CPU limit for the Streamvisor pod                                                        | `2000m`                   |
| `deployment.extraVolumeMounts`         | Extra volume mounts to add to the deployment spec, for example to mount TLS certificates | `nil`                     |
| `deployment.extraVolumes`              | Extra volumes to add to the deployment spec, for example to mount TLS certificates       | `nil`                     |

### Streamvisor configuration properties

Refer to our [documentation](https://docs.streamvisor.com/installation/configuration-reference/) for the full list of configuration properties

| Name     | Description                                                | Value |
| -------- | ---------------------------------------------------------- | ----- |
| `config` | Configuration properties to mount as environment variables | `nil` |

### Streamvisor persistence parameters

Parameters for Streamvisor persistence

| Name                        | Description                                                                                                     | Value               |
| --------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------- |
| `persistence.enabled`       | If true, persists Streamvisor data to a PersistentVolumeClaim. Please always enable this in a production setup! | `false`             |
| `persistence.existingClaim` | If set use existing volume claim with specified name instead of provisioning one                                | `nil`               |
| `persistence.annotations`   | Annotations for Streamvisor PersistentVolumeClaim                                                               | `{}`                |
| `persistence.accessModes`   | Access modes for Streamvisor PersistentVolumeClaim                                                              | `["ReadWriteOnce"]` |
| `persistence.size`          | Size for Streamvisor PersistentVolumeClaim                                                                      | `1Gi`               |
| `persistence.storageClass`  | Storage class name for Streamvisor PersistentVolumeClaim                                                        | `nil`               |

### Streamvisor credentials secret parameters

Parameters for Streamvisor credentials secret

| Name                                   | Description                                                                            | Value               |
| -------------------------------------- | -------------------------------------------------------------------------------------- | ------------------- |
| `secretCredentials.existingSecretName` | If set use existing credentials secret with specified name instead of provisioning one | `nil`               |
| `secretCredentials.admin.username`     | Streamvisor admin username                                                             | `admin`             |
| `secretCredentials.admin.password`     | Streamvisor admin password                                                             | `pulsar`            |
| `secretCredentials.admin.email`        | Streamvisor admin email                                                                | `admin@example.org` |

### Streamvisor service parameters

Parameters for Streamvisor service

| Name                  | Description                     | Value          |
| --------------------- | ------------------------------- | -------------- |
| `service.type`        | Streamvisor service type        | `LoadBalancer` |
| `service.port`        | Streamvisor service port        | `9527`         |
| `service.targetPort`  | Streamvisor service target port | `9527`         |
| `service.annotations` | Streamvisor service annotation  | `{}`           |

### Streamvisor ingress parameters

Parameters for Streamvisor ingress

| Name                       | Description                                                                           | Value   |
| -------------------------- | ------------------------------------------------------------------------------------- | ------- |
| `ingress.enabled`          | If true, provisions an ingress for Streamvisor                                        | `false` |
| `ingress.annotations`      | Streamvisor ingress annotations                                                       | `{}`    |
| `ingress.ingressClassName` | Streamvisor ingress class name                                                        | `""`    |
| `ingress.tls.enabled`      | If true, enable TLS configuration                                                     | `false` |
| `ingress.tls.secretName`   | Optional. Leave it blank if your Ingress Controller can provide a default certificate | `""`    |
| `ingress.hostname`         | Streamvisor ingress host name                                                         | `""`    |
| `ingress.path`             | Streamvisor ingress path                                                              | `/`     |

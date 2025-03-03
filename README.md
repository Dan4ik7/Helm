# The Helm Library for Kubernetes

This Repo includes Helm Chrats made specific for learning scope in order to master Helm. 

##Before you begin

# One Chart Example

The Docker workshop for getting started: 
- [Docker Workshop](https://docs.docker.com/get-started/)
- [Release code](https://github.com/docker/getting-started-app)

### Docker example Helm

This repo includes the Docker app which is a helm chart that deploys the app in kubernetes

### Pre-requisities

- [Kubernetes 1.23+](https://kubernetes.io/releases/)
- [Helm 3.8.0+](https://helm.sh/docs/)
- [LoadBalancer](https://metallb.universe.tf/installation/) like metallb
- [Nginx](https://docs.nginx.com/nginx-ingress-controller/installation/installing-nic/installation-with-helm/) ingress controller 

### Install Helm

Helm is a tool for managing Kubernetes charts. Charts are packages of pre-configured Kubernetes resources.

To install Helm, refer to the [Helm install guide](https://github.com/helm/helm#install) and ensure that the `helm` binary is in the `PATH` of your shell.

### Using Helm

Once you have installed the Helm client, you can deploy a Bitnami Helm Chart into a Kubernetes cluster.

Please refer to the [Quick Start guide](https://helm.sh/docs/intro/quickstart/) if you wish to get running in just a few commands, otherwise, the [Using Helm Guide](https://helm.sh/docs/intro/using_helm/) provides detailed instructions on how to use the Helm client to manage packages on your Kubernetes cluster.

Useful Helm Client Commands:

- Install a chart: `helm install my-release oci://registry-1.docker.io/mirondaniel7/<chart>`
- Upgrade your application: `helm upgrade my-release oci://registry-1.docker.io/mirondaniel7/<chart>`



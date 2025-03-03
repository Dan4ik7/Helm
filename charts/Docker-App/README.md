# docker-app-helm
A docker app provisioned in k8s via helm package manager 

The Application is provided by docker workshop: 

- [Docker-workshop](https://docs.docker.com/get-started/workshop/08_using_compose/)

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add Helm http://Dan4ik7.github.io/Helm

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
{alias}` to see the charts.

To install the Helm chart:

    helm install demo Helm/docker-app

To uninstall the chart:

    helm delete demo

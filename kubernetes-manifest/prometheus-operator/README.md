# Installation
- Add chart reposistory
```shell
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```
- Install chart
```shell
helm install kube-prom prometheus-community/kube-prometheus-stack --values values.yaml
```


# Install apisix with custom image

```bash
helm repo add apisix https://charts.apiseven.com
helm repo update
helm install apisix apisix/apisix \
--set image.repository=tabeldata/apisix  \
--set image.tag=v1 \
--create-namespace \
--namespace apigateway

helm install apisix-dashboard apisix/apisix-dashboard \
--set service.type=NodePort \
--create-namespace \
--namespace apigateway
```

## install clickhouse docker image

```bash
docker run -d -p 9000:9000 -d --name clickhouse-server --ulimit nofile=262144:262144 clickhouse/clickhouse-server
```

## install clickhouse on kubernetes

```bash
helm install zookeeper \
    --set zookeeper.enabled=false \
    --set persistence.size=100Mi \
    --set replicaCount=1 \
    oci://registry-1.docker.io/bitnamicharts/zookeeper
```
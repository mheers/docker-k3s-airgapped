# k3s-airgapped

## Start

```bash
docker run \
  --rm \
  --privileged \
  --name k3s-server-1 \
  --hostname k3s-server-1 \
  -p 6443:6443 \
  rancher/k3s:v1.27.7-k3s2 \
  server
```

## Debug

```bash
docker run \
  --rm \
  -it \
  --privileged \
  --name k3s-server-1 \
  --hostname k3s-server-1 \
  -p 6443:6443 \
  --entrypoint /bin/sh \
  rancher/k3s:v1.27.7-k3s2
```

<!-- docker exec k3s-server-1 cat /etc/rancher/k3s/k3s.yaml > kubeconfig -->

cat images | xargs -I{} docker pull {}
docker image save $(cat images | xargs) -o bundle_file

docker build -t mheers/k3s-airgapped .

## TODO

- [x] generate list of images automatically
- [x] optimize docker image size
- [x] parameterize k3s version
- [ ] publish image
- [ ] mount custom manifests

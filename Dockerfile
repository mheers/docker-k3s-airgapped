ARG K3S_VERSION

FROM alpine:3.18 as k3s-airgap-images

ARG K3S_VERSION
ARG BUILDPLATFORM
ARG TARGETPLATFORM

RUN apk add curl

ENV BUILDPLATFORM=$BUILDPLATFORM
ENV TARGETPLATFORM=$TARGETPLATFORM
ENV K3S_VERSION=$K3S_VERSION

RUN curl -sSL https://github.com/k3s-io/k3s/releases/download/$(echo $K3S_VERSION | sed -r 's/-/%2B/g')/k3s-airgap-images-$(echo ${TARGETPLATFORM} | cut -d '/' -f 2).tar.gz >  /var/k3s-airgap-images.tar.gz

FROM --platform=$TARGETPLATFORM rancher/k3s:${K3S_VERSION} as base

COPY --from=k3s-airgap-images /var/k3s-airgap-images.tar.gz /var/lib/rancher/k3s/agent/images/

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

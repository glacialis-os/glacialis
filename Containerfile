ARG BASE_IMAGE_NAME="sericea"
ARG FEDORA_MAJOR_VERSION="40"
ARG SOURCE_IMAGE="${BASE_IMAGE_NAME}-main"
ARG BASE_IMAGE="ghcr.io/ublue-os/${SOURCE_IMAGE}"

FROM scratch AS ctx
COPY / /

## aurora image section
FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS base

ARG AKMODS_FLAVOR="coreos-stable"
ARG BASE_IMAGE_NAME="sericea"
ARG FEDORA_MAJOR_VERSION="40"
ARG IMAGE_NAME="glacialis"
ARG IMAGE_VENDOR="glacialis-os"
ARG KERNEL="6.10.10-200.fc40.x86_64"
ARG SHA_HEAD_SHORT="dedbeef"
ARG UBLUE_IMAGE_TAG="stable"
ARG VERSION=""

# Build, cleanup, commit.
RUN --mount=type=cache,dst=/var/cache/libdnf5 \
    --mount=type=cache,dst=/var/cache/rpm-ostree \
    --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build_files/shared/build-base.sh

## aurora-dx developer edition image section
FROM base AS dx

ARG AKMODS_FLAVOR="coreos-stable"
ARG BASE_IMAGE_NAME="sericia"
ARG FEDORA_MAJOR_VERSION="40"
ARG IMAGE_NAME="glacialis-dx"
ARG IMAGE_VENDOR="glacialis-os"
ARG KERNEL="6.10.10-200.fc40.x86_64"
ARG SHA_HEAD_SHORT="dedbeef"
ARG UBLUE_IMAGE_TAG="stable"
ARG VERSION=""

# Build, Clean-up, Commit
RUN --mount=type=cache,dst=/var/cache/libdnf5 \
    --mount=type=cache,dst=/var/cache/rpm-ostree \
    --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build_files/shared/build-dx.sh

# SPDX-FileCopyrightText: © 2025 Nfrastack <code@nfrastack.com>
#
# SPDX-License-Identifier: MIT

ARG \
    BASE_IMAGE \
    DISTRO \
    DISTRO_VARIANT

FROM ${BASE_IMAGE}:${DISTRO}_${DISTRO_VARIANT}

LABEL \
        org.opencontainers.image.title="Airsonic Advanced" \
        org.opencontainers.image.description="Media Library and player" \
        org.opencontainers.image.url="https://hub.docker.com/r/nfrastack/airsonic-advanced" \
        org.opencontainers.image.documentation="https://github.com/nfrastack/container-airsonic-advanced/blob/main/README.md" \
        org.opencontainers.image.source="https://github.com/nfrastack/container-airsonic-advanced.git" \
        org.opencontainers.image.authors="Nfrastack <code@nfrastack.com>" \
        org.opencontainers.image.vendor="Nfrastack <https://www.nfrastack.com>" \
        org.opencontainers.image.licenses="MIT"
ARG \
    AIRSONIC_VERSION="11.1.5-SNAPSHOT.20250830125103" \
    AIRSONIC_REPO_URL="https://github.com/kagemomiji/airsonic-advanced/"

ENV \
    IMAGE_NAME="nfrastack/airsonic-advanced" \
    IMAGE_REPO_URL="https://github.com/nfrastack/container-airsonic-advanced/"

COPY CHANGELOG.md /usr/src/container/CHANGELOG.md
COPY LICENSE /usr/src/container/LICENSE
COPY README.md /usr/src/container/README.md

RUN echo "" && \
    AIRSONIC_BUILD_DEPS_ALPINE=" \
                               " \
                                    && \
    AIRSONIC_RUN_DEPS_ALPINE=" \
                                ffmpeg \
                                flac \
                                fontconfig \
                                lame \
                                mariadb-client \
                                openjdk21-jre \
                                postgresql-client \
                                ttf-dejavu \
                            " \
                            && \
    \
    source /container/base/functions/container/build && \
    container_build_log image && \
    create_user airsonic 4040 airsonic 4040 /dev/null && \
    package update && \
    package upgrade && \
    package install \
                        AIRSONIC_BUILD_DEPS \
                        AIRSONIC_RUN_DEPS \
                        && \
    \
    mkdir -p /app && \
    chown -R airsonic:airsonic /app && \
    curl -sSL "${AIRSONIC_REPO_URL}"/releases/download/${AIRSONIC_VERSION}/airsonic.war -o /app/airsonic.war && \
    container_build_log add "Airsonic Advanced" "${AIRSONIC_VERSION}" "${AIRSONIC_REPO_URL}" && \
    package cleanup

EXPOSE 4040

COPY rootfs /

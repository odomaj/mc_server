FROM alpine:3.22.0

RUN apk add --no-cache curl openjdk21 libudev-zero

ARG MINECRAFT_HOME=/home/minecraft
RUN addgroup --gid 1000 minecraft && \
    adduser --system \
            --shell /bin/false \
            --uid 1000 \
            -G minecraft \
            --home "${MINECRAFT_HOME}" \
            minecraft
USER minecraft

ARG MINECRAFT_VERSION
RUN curl --output "${MINECRAFT_HOME}/server.jar" $( \
    curl --silent "https://mcversions.net/download/${MINECRAFT_VERSION}" | \
    grep -oE 'https?://[^"]+/server\.jar' | \
    head -n 1)

ADD startup.sh "${MINECRAFT_HOME}/startup.sh"
USER root
RUN chmod +x "${MINECRAFT_HOME}/startup.sh"
USER minecraft

EXPOSE 25565

WORKDIR "${MINECRAFT_HOME}/save"
ENTRYPOINT ["../startup.sh"]

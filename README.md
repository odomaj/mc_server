# Minimal Vanilla Minecraft Server
This repo is designed to be a containerized Vanilla Minecraft Server setup using Docker.

## Requirements
This repo requires a minimal Docker setup to run.

1. [Docker](https://docs.docker.com/)
2. [Docker Compose](https://docs.docker.com/compose/)

> [!NOTE]
> This repo was designed to run on Linux. No guarentees that this setup runs on Windows.

## Quick Start

```sh
# building the server
docker compose build
```

```sh
# starting the server
docker compose up --detach
```

```sh
# stopping the server
docker compose down
```

## Configuring
Several server configuration options are available in ``.env``.

1. ``MINECRAFT_VERSION``: sets the desired Vanilla Minecraft version
1. ``SERVER_PORT``: sets the port the server is visible on
1. ``MAX_RAM``: sets the max ram allocation available to Java within the container

The default properties file for Vanilla Minecraft has been provided in ``save/server.properties``
for full configuration options.

> [!WARNING]
> Do NOT change the server port within server.properties

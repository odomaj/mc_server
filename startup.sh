#!/bin/sh

java -Xmx${MAX_RAM} -Xmx${MAX_RAM} -jar "${MINECRAFT_HOME}/server.jar" nogui

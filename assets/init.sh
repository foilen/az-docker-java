#!/bin/bash
set -e

echo "SSH Start"
service ssh start

if [ -z "$SERVICE_COMMAND" ]; then
  SERVICE_COMMAND=/wait.sh
fi
echo "SERVICE_COMMAND : $SERVICE_COMMAND"

$SERVICE_COMMAND

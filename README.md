# Description

A Java image for Microsoft Azure.

It is using the instruction from https://docs.microsoft.com/en-us/azure/app-service/configure-custom-container?pivots=container-linux to have a usable image.

It is executing /wait.sh by default, but you can modify it once you added your jar.

# Build and test

```
./create-local-release.sh

docker run -ti --rm az-docker-java:master-SNAPSHOT

```

# Available environment config

- SERVICE_COMMAND=/home/site/wwwroot/start.sh

- WEBSITES_ENABLE_APP_SERVICE_STORAGE=false

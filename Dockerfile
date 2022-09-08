FROM ubuntu:22.04

# Apache and PHP
RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
    apt-utils \
    git \
    gnupg2 \
    imagemagick \
    openjdk-11-jdk=11.0.16+8-0ubuntu1~22.04 \
    curl less vim wget rsync \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# ImageMagick can create PDF
COPY assets/policy.xml /etc/ImageMagick-6/policy.xml

# ssh
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
	&& apt-get install -y --no-install-recommends openssh-server \
	&& echo "$SSH_PASSWD" | chpasswd
COPY assets/sshd_config /etc/ssh/

# Init script
COPY assets/init.sh /
COPY assets/wait.sh /
RUN chmod u+x /init.sh /wait.sh

EXPOSE 2222 80

CMD /init.sh

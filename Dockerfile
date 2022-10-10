FROM debian:bullseye

USER root
WORKDIR /root

ADD pause /bin/pause
ADD kubectl /bin/kubectl
ADD modd /bin/modd
ADD bashrc.sh .bashrc
ADD packages.txt packages.txt
CMD ["/bin/pause"]

RUN apt-get update \
 && xargs -a packages.txt apt-get install -y --no-install-recommends \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /var/lib/apt/mirror/partial/*

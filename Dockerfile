FROM debian:latest

USER root
WORKDIR /root
ADD pause /bin/pause
ADD packages.txt packages.txt

RUN apt-get update \
 && xargs -a packages.txt apt-get install -y --no-install-recommends \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /var/lib/apt/mirror/partial/*

ADD kubectl /bin/kubectl
ADD bashrc.sh .bashrc

CMD /bin/pause

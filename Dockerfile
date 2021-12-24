FROM ubuntu:latest

RUN apt-get update && \
    apt-get install curl gnupg2 unzip git -y && \
    echo "deb https://download.gocd.org /" | tee /etc/apt/sources.list.d/gocd.list && \
    curl https://download.gocd.org/GOCD-GPG-KEY.asc | apt-key add - && \
    apt-get update && \
    apt-get install go-agent && \
    curl -L -O https://releases.hashicorp.com/terraform/1.1.2/terraform_1.1.2_linux_amd64.zip && \
    unzip terraform_1.1.2_linux_amd64.zip && \
    mv terraform /usr/bin/ && \
    rm /terraform_1.1.2_linux_amd64.zip && \
    sed -i "s/localhost/172.16.221.45/g" /usr/share/go-agent/wrapper-config/wrapper-properties.conf && \
    echo "#!/bin/bash" > /home/docker-entrypoint.sh && \
    echo "/etc/init.d/go-agent start" >> /home/docker-entrypoint.sh && \
    echo "while true; do sleep 100; done" >> /home/docker-entrypoint.sh && \
    chmod +x /home/docker-entrypoint.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT  ["/home/docker-entrypoint.sh"]

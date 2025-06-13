FROM debian:buster

COPY conf/setup_grafana.sh setup_grafana.sh
COPY conf/default_datasources.yaml /usr/share/grafana/conf/provisioning/datasources/default.yaml
COPY conf/default_plugins.yaml /usr/share/grafana/conf/provisioning/plugins/default.yaml

ARG DOMAIN_NAME

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo && \
    sudo apt-get install -y apt-transport-https software-properties-common wget sudo vim zsh procps gpg && \
    sudo mkdir -p /etc/apt/keyrings/ && \
    wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null && \
    echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list && \
    sudo apt-get update && \
    sudo apt-get install -y grafana && \
    chmod 755 setup_grafana.sh

COPY conf/sample.ini /usr/share/grafana/conf/sample.ini

RUN chmod 777 /usr/share/grafana/conf/sample.ini
RUN chmod 777 /usr/share/grafana/conf/provisioning/datasources/default.yaml
RUN chmod 777 /usr/share/grafana/conf/provisioning/plugins/default.yaml

ENTRYPOINT ["/setup_grafana.sh"]
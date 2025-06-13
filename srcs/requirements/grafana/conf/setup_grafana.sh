#!/bin/bash

GRAFANA_USER_PASSWORD=`cat /run/secrets/grafana_user_password`;
sed -i "330s/.*/admin_password = $GRAFANA_USER_PASSWORD/" /usr/share/grafana/conf/sample.ini;

DB_PASSWORD=`cat /run/secrets/db_password`;
sed -i "15s/.*/      password: $DB_PASSWORD/" /usr/share/grafana/conf/provisioning/datasources/default.yaml;

cd /usr/share/grafana;

sudo bin/grafana cli --pluginsDir /usr/share/grafana/data/plugins/ plugins install redis-datasource;
sudo bin/grafana cli --pluginsDir /usr/share/grafana/data/plugins/ plugins install redis-app;

exec bin/grafana server --config conf/sample.ini;
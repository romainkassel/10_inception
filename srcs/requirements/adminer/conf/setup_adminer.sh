#!/bin/bash

git clone https://github.com/dracula/adminer.git;
mkdir -p /usr/share/adminer/designs/dracula;
cp adminer/theme/adminer.css /usr/share/adminer/designs/dracula;
rm /usr/share/adminer/adminer/static/default.css;
mv /usr/share/adminer/designs/dracula/adminer.css /usr/share/adminer/adminer/static/default.css;

# Moving ressources to be served correctly with nginx reverse proxy

mkdir -p /usr/share/adminer/adminer/externals/;
mv /usr/share/adminer/externals/jush/ /usr/share/adminer/adminer/externals/;

mkdir -p /usr/share/adminer/adminer/static/;
mv /var/adminer/adminer/static/editing.js /usr/share/adminer/adminer/static/editing.js;

mkdir -p /usr/share/adminer/editor/static/;
mv /var/adminer/editor/static/editing.js /usr/share/adminer/editor/static/editing.js;

cd /usr/share/adminer;
exec php -S 0.0.0.0:8000;

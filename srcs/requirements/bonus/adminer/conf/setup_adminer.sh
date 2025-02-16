#!/bin/bash

git clone https://github.com/dracula/adminer.git;
mkdir -p /usr/share/adminer/designs/dracula;
cp adminer/theme/adminer.css /usr/share/adminer/designs/dracula;
rm /usr/share/adminer/adminer/static/default.css;
mv /usr/share/adminer/designs/dracula/adminer.css /usr/share/adminer/adminer/static/default.css;

cd /usr/share/adminer;
exec php -S 0.0.0.0:8000;
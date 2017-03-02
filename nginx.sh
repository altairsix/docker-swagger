#!/bin/bash

DEFAULT_URL="http://petstore.swagger.io/v2/swagger.json"
URL="${URL:=${DEFAULT_URL}}"

sed "s,${DEFAULT_URL},${URL},g" /public/swagger/index.html > /public/swagger/index.new
mv /public/swagger/index.new /public/swagger/index.html

/usr/sbin/nginx


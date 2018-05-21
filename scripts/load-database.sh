#!/bin/bash
uri="PUT_MYSQL_URI_HERE"

# Load helper function
source helper.sh

# Do the URL parsing
uri_parser $uri

# Extract MYSQL information
user=${uri_user}
password=${uri_password}
host=${uri_host}
port=${uri_port}
# drop the leading '/' from the path
database=`echo ${uri_path} | sed -e 's/^\///'`

# Put database name in sql script
if [[ $OSTYPE =~ .*darwin.* ]]; then
	sed -i.bak "s/inventory/${database}/g" load-data.sql

elif [[ $OSTYPE =~ .*linux.* ]]; then
  	sed -i "s/inventory/${database}/g" load-data.sql
fi

# Load sql script into database
mysql -v -u${user} -p${password} --host ${host} --port ${port} <load-data.sql
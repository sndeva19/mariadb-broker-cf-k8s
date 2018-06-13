export BROKER_USERNAME=test
export BROKER_PASSWORD=test

# MariaDB
export MYSQL_HOST=localhost
export MYSQL_PORT=3306
export MYSQL_USER=root
export MYSQL_PASSWORD=

# Used only in the Helm Chart
# Used for exposing MariaDB instance outside of ICP
# Use the IP of one of the proxy/worker nodes for Host
# Use the port number exposed in the MariaDB service
export MYSQL_HOST_PUBLIC=
export MYSQL_PORT_PUBLIC=
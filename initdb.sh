#!/bin/sh
dropdb --if-exists learncms
createdb learncms -E UTF8
dropuser --if-exists learncms
psql learncms -c "CREATE USER learncms WITH PASSWORD 'default';"
psql learncms -c 'GRANT ALL PRIVILEGES ON DATABASE "learncms" to learncms;'
psql learncms -c 'alter user "learncms" grant createdb;' # necessary for Django tests

#!/bin/sh
## setup some paths ##
composer="/usr/bin/composer"
artisan="/data/crm_docker/httpdocs"
php="/usr/bin/php"
runuser="/usr/sbin/runuser"

#sleep for 2 seconds  and wait for mysql to start
sleep 2

cd $artisan

echo "Running artisan"

$runuser -l apache -c "$composer install -d $artisan  -v"

$runuser -l apache -c "$php $artisan migrate"
$runuser -l apache -c "$php $artisan db:seed"
$runuser -l apache -c "$php $artisan view:clear"
$runuser -l apache -c "$php $artisan cache:clear"
$runuser -l apache -c "$php $artisan config:cache"
$runuser -l apache -c "$php $artisan optimize"

$runuser -l apache -c "$php $artisan responsecache:flush"


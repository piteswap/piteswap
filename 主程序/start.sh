#! /bin/sh
composer install
php artisan key:generate
php artisan migrate:refresh --seed


cd public/vendor/webmsgsender && php start.php start -d
cd ../../../ && php php artisan websocket:client start --mode=d
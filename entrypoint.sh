#!/bin/sh -l
echo $1
echo $2
echo $3

composer install
composer global require lamp-io/lio dev-master --update-with-dependencies
mkdir -p $HOME/.config/lamp.io/
$HOME/.composer/vendor/bin/lio auth -t $1
if [ $3 ]; then
  sqlite='--sqlite'
else
   sqlite=''
fi
$HOME/.composer/vendor/bin/lio deploy --$2 $sqlite -n
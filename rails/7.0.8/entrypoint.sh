#!/bin/sh

if [ -z "$@" ]; then
	if [ ! -f .done-init ]; then
		# clean up
		rm -rf *
		# rails new
		rails new . -f -m /usr/src/template.rb
		# save state
		touch .done-init
	fi
	rails server -b 0.0.0.0
else
        exec "$@"
fi


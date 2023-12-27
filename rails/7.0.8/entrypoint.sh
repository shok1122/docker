#!/bin/bash

if [ -z "$@" ]; then
	if [ ! -f .done-init ]; then
		# rails new
		rails new . -f -m /usr/src/template.rb -T --minimal
		rm -rf .git
		# save state
		touch .done-init
	fi
	rails server -b 0.0.0.0
else
        exec "$@"
fi


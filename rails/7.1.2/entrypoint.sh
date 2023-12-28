#!/bin/bash

echo "command: $@"

if [ "start" = "$1" ]; then
	shift
	if [ ! -f .done-init ]; then
		# ===========================
		# clean up
		# ===========================
		rm -rf * .*

		# ===========================
		# make option
		# ===========================
		opt="$@"
		if [ "$DB_TYPE" = "postgres" ]; then
			opt="$opt --database=postgresql"
		fi

		# ===========================
		# Create rails app
		# ===========================
		rails new . $opt
		if [ "$DB_TYPE" = "postgres" ]; then
			cp ../lib/postgres.yml config/database.yml
		fi

		# ===========================
		# Post-processing
		# ===========================
		rm -rf .git
		touch .done-init
	fi

	# ===========================
	# Run server
	# ===========================
	rm -f tmp/pids/server.pid
	bin/rails server -b 0.0.0.0
else
	# ===========================
	# Exec any command
	# ===========================
        exec "$@"
fi


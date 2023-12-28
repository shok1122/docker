#!/bin/bash

# Generate Book model
bin/rails generate scaffold Book \
	title:string \
	author:string \
	published_at:datetime \
	price:integer

bin/rails db:migrate

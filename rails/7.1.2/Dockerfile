FROM ruby:3.3.0

ARG PATH_ROOT=/usr/local/rails

RUN apt-get update \
	&& apt-get install -y \
		vim \
		postgresql-client \
	&& gem install \
		rails:7.1.2

WORKDIR $PATH_ROOT/lib

COPY template.rb template.rb
COPY sample.sh sample.sh
COPY postgres.yml postgres.yml

WORKDIR $PATH_ROOT/var

RUN bundle config set --local path .bundle

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]

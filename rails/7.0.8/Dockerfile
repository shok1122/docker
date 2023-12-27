FROM ruby:3.2.2

ARG PATH_APP="/usr/src/app"

RUN apt-get update \
	&& apt install -y \
		vim \
	&& gem install \
		rails:7.0.8

WORKDIR /usr/src

COPY template.rb template.rb

WORKDIR $PATH_APP

RUN bundle config set --local path vendor/bundle

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["/entrypoint.sh"]

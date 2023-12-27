FROM rails:5.0.0.1

RUN apt-get update \
	&& apt install -y \
		vim

COPY Gemfile Gemfile

RUN bundle install

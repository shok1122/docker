FROM ruby:3.2.2

WORKDIR /root

RUN apt update \
	&& apt install -y \
		vim

COPY Gemfile Gemfile

RUN bundle install

CMD ["bash"]

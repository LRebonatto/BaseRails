FROM silvioq/ruby-1.8.7

RUN apt-get update -qq && \
  apt-get install -y build-essential libpq-dev nodejs imagemagick gnupg curl locales \
  && mkdir -p /usr/share/man/man1 \
  && mkdir -p /usr/share/man/man7

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV INSTALL_PATH /usr/src/app
WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile.lock ./

RUN gem install rake -v 10.1.0
RUN gem install bundler -v 1.16.0
RUN bundle install

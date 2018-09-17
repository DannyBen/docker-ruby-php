FROM alpine:edge

ENV PACKAGES \
    bash curl curl-dev ruby-dev build-base \
    php7 php7-sockets \
    ruby ruby-io-console ruby-irb ruby-json libffi-dev zlib-dev ruby-bigdecimal

ENV TERM=linux

ENV PS1 "\n\n>> ruby-php \W \$ "

WORKDIR /app

RUN apk --no-cache add $PACKAGES 

COPY resources/php.ini /etc/php7/php.ini

RUN echo 'gem: --no-document' > /etc/gemrc && \
    gem install bundler

RUN bundle config --global silence_root_warning 1

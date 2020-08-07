FROM ruby:2.7-alpine3.10
RUN apk --no-cache add git build-base ruby-dev \
  && cd /tmp/ \
  && git clone https://github.com/ninoseki/kokki.git \
  && cd kokki \
  && gem build kokki.gemspec -o kokki.gem \
  && gem install kokki.gem \
  && rm -rf /tmp/kokki \
  && apk del --purge git build-base ruby-dev

ENTRYPOINT ["kokki"]

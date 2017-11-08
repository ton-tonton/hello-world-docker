FROM ruby:2.3-alpine

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apk update && apk add build-base postgresql-dev nodejs linux-headers tzdata

ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

RUN bundle install

ADD . $APP_HOME

EXPOSE 3000

CMD rails server -b 0.0.0.0 -p 3000

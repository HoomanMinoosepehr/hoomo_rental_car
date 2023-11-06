FROM ruby:3.0.2

WORKDIR ./app

COPY Gemfile Gemfile.lock ./

RUN apt-get update -qq && apt-get install -y node.js

RUN bundle install

COPY . .

EXPOSE 3030

CMD ["rails", "s", "-b", "0.0.0.0", "-p", "3030"]
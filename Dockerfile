FROM ruby:2.7.1

RUN apt-get update && apt-get install -y curl build-essential libpq-dev
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    && apt-get update && apt-get install -y yarn

WORKDIR /app

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . /app

ENV BUNDLE_PATH /bundle
ENV PATH /app/bin:$PATH

RUN gem install bundler -v 2.1.4 --no-document
RUN bundle install

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

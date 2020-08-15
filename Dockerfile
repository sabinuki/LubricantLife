FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y nodejs yarn
RUN mkdir /LubricantLife
WORKDIR /LubricantLife
COPY Gemfile /LubricantLife/Gemfile
COPY Gemfile.lock /LubricantLife/Gemfile.lock
RUN bundle install
COPY . /LubricantLife

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
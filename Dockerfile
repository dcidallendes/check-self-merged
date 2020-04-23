FROM ruby:2.7

# Install gitlab client
RUN gem install gitlab

WORKDIR /script

COPY . .

ENTRYPOINT []
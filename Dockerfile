FROM ruby:2.7

WORKDIR /usr/local/bin

COPY check-self-merged.rb .
# Install gitlab client
RUN gem install gitlab \
    && chmod +x check-self-merged.rb

CMD ["check-self-merged.rb"]

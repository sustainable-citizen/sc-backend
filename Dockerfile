# SC-Backend Image

ARG RUBY_VERSION=2.3.3
FROM ruby:${RUBY_VERSION}

ENV SC_BACKEND_HOME=sc-backend \
    RUBY_VERSION=${RUBY_VERSION} \
    GEM_HOME="/usr/local/bundle"

ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

EXPOSE 3000

RUN mkdir /${SC_BACKEND_HOME}
WORKDIR /${SC_BACKEND_HOME}
VOLUME /var/log/
COPY Gemfile Gemfile.lock /${SC_BACKEND_HOME}/
RUN bundle install
COPY . /${SC_BACKEND_HOME}



ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["rails", "server", "puma"]

CMD rails s
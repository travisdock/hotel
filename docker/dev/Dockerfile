FROM ruby:3.2.1

ENV APP_HOME="/app_home"
ENV BUNDLE_PATH="${APP_HOME}/vendor/bundle"

RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash -
RUN apt-get install -y nodejs

RUN apt-get install -y libvips

RUN echo 'alias rails="bundle exec rails"' >> ~/.bashrc

WORKDIR $APP_HOME

EXPOSE 3000

ENTRYPOINT ["./bin/entrypoint.sh"]
CMD ["./bin/start.sh"]

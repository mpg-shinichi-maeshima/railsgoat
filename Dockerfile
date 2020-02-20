FROM ruby:2.6.5
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google-chrome.list \
 && curl -s https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
 && apt-get update -qq \
 && apt-get install -y --no-install-recommends build-essential libpq-dev nodejs google-chrome-stable chromium-driver \
 && apt-get clean \
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp


# Dockerfile
FROM ruby:2.6.1

WORKDIR /root/rails_sample1

# google-chrome-stable repository
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
  
# install latest nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get update \
  && apt-get -y install nodejs \
                        postgresql-client \
                        vim tmux git curl less ctags unzip \
                        locales locales-all \
                        google-chrome-stable \
                        silversearcher-ag \
                        --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install chrome
RUN wget https://chromedriver.storage.googleapis.com/2.44/chromedriver_linux64.zip \
  && unzip chromedriver_linux64.zip \
  && mv chromedriver /usr/local/bin

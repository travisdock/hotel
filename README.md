```
docker run -it -v /Users/me/development:/development -w /development ruby:latest bash
curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt-get install -y nodejs
# update npm
npm install -g npm@9.6.1
npm install --global yarn
gem install rails
rails new app_name -j esbuild --css tailwind --skip-action-mailbox -d postgresql --skip-active-storage -a propshaft --skip-jbuilder
```

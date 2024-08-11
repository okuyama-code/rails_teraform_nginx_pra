# 最新の安定版Rubyを使用
FROM ruby:3.2.2

# 環境変数の設定
ENV LANG C.UTF-8
ENV APP_PATH /sample

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev

# Node.jsの最新LTS版をインストール
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Yarnの最新版をインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# アプリケーションディレクトリの作成
RUN mkdir $APP_PATH
WORKDIR $APP_PATH

# GemfileとGemfile.lockをコピー
COPY Gemfile $APP_PATH/Gemfile
COPY Gemfile.lock $APP_PATH/Gemfile.lock

# Bundlerの最新版をインストールし、依存関係をインストール
RUN gem install bundler
RUN bundle install

# アプリケーションのソースをコピー
COPY . $APP_PATH

# socketsディレクトリの作成
RUN mkdir -p tmp/sockets
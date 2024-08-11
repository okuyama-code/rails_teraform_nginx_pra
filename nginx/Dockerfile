# ベースイメージとしてNginx version 1.15.8を使用
FROM nginx:1.15.8

# デフォルトの設定ファイルを削除
RUN rm -f /etc/nginx/conf.d/*

# カスタムの設定ファイルを追加
ADD nginx.conf /etc/nginx/conf.d/sample.conf

# Nginxを起動するコマンドを指定
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
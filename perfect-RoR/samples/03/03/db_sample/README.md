# README

MySQLのレプリケーション環境を動かしてreadingロールとしてレプリケーションサーバーを参照するための環境を作成します

## MySQLの起動

```sh
% docker-compose up
```

接続情報は以下の通り

- master
    - host `localhost`
    - port `33061`
    - user `root`
    - password なし
- replication
    - host `localhost`
    - port `33062`
    - user `root`
    - password なし

## Railsアプリケーションの起動

MySQLのDockerイメージを起動したあとにdb:createなどを実行します

```sh
% bundle install
% bin/rails db:create
% bin/rails db:migrate
% bin/rails c
```


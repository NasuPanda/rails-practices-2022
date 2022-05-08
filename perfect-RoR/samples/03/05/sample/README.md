# README

## Ealry Hintsを試す場合

このサンプルコードではではDockerを使ってH2Oを動かすことが可能です

### H2Oの起動

docker-composeを実行すると、イメージのビルドが実行され、port 9090でh2oが起動します。

```sh
% docker-compose up
```

### Railsアプリの起動

初回はDBの作成をしておきます

```sh
% bin/rails db:create
% bin/rails db:migrate
```

Dockerイメージを起動したまま、別のターミナルでRailsアプリケーションを起動させます

```sh
% bin/rails s --early-hints
```

Docker上のH2OとRailsアプリが起動している状態で以下のURLにアクセスするとHTTPS環境でRailsアプリにアクセスできます

https://localhost:9090/todos
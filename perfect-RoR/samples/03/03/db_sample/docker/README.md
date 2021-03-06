# docker-mysql-replicate
DockerのMySQLを使ってかんたんにレプリケーション環境を作ります

## 動作させるには

```sh
% docker-compose up
```

マスターサーバーへアクセス

```sh
% mysql -h 127.0.0.1 -P 33061 -u root -p
```

レプリケーションサーバーへアクセス

```sh
% mysql -h 127.0.0.1 -P 33062 -u root -p
```

## メモ

- ユーザーはrootのみ。パスワード指定なし
- `port 33061` でmasterのコンテナが起動する
- `port 33062` でreplicationのコンテナが起動する
- レプリケーション自体は動かしているが、既存データの同期はしていない
- rootパスワードの変更や `mysql_master` の名称を変更する場合は `start-slave.sh` の内容も変更する必要がある

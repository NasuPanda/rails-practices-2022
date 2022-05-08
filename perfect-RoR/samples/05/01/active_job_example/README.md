# README

Sidekiqを使う設定になっているので、Sidekiqとredisを起動させる必要があります。

## 起動

redisはdocker-composeを使ってredisを起動します。

```sh
% docker-compose up
```

SidekiqをSidekiqを起動します。

```sh
% bundle exec sidekiq
```

Railsコンソールを起動してジョブを投入します。

```sh
% bin/rails c
irb(main):001:0> AsyncLogJob.perform_later
```

正常に処理が実行できれば`AsyncLog`モデルにレコードが追加されます。

## Sidekiqの設定について

- dashboard
    - http://localhost:3000/sidekiq/
- 設定ファイル
    - config/sidekiq.yml

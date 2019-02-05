# RailsGoat

RailsGoat は、Ruby on Rails 5 で開発されたウェブアプリケーションの脆弱性のあるバージョンです。OWASP Top 10 の脆弱性、およびプロジェクトメンバーが共有する価値があると感じた「追加の」脆弱性が含まれています。このプロジェクトは、開発者とセキュリティ専門家の両方を教育することを目的としています。

## Docker Install

Railsgoat を実行するには、最初に [Docker](https://docs.docker.com/install/) と [Docker Compose](https://docs.docker.com/compose/install/) をインストールしておく必要があります。これらの依存関係がインストールされたら、コードをクローンした Railsgoat ディレクトリに移動して実行します。Rails は Compose **1.6.0** 以上とバージョン **1.10.0** 以上の Docker Engine を必要とします。

```
#~/code/railsgoat
$ docker-compose build
$ docker-compose run web rails db:setup
$ docker-compose up
...
  Creating railsgoat_web_1
  Attaching to railsgoat_web_1
```
上記のメッセージが表示されたら、Railsgoat はローカルホストのポート 3000 で実行されています。

お気に入りのブラウザを開き、`http://localhost:3000` に移動してハッキングを始めましょう。

注意: コンテナがエラーで終了する場合は、サーバが既に起動している可能性があります。
```
A server is already running. Check /myapp/tmp/pids/server.pid.
=> Booting Thin
=> Rails 5.0.1 application starting in development on
http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
Exiting
```
この場合は、server.pid ファイルを削除してやり直してください。このファイルは現在の作業ディレクトリにあり、コンテナの中にはありません。

## Capybara Tests

RailsGoat には、失敗する Capybara RSpec セットが含まれており、それぞれがアプリケーションに個別の脆弱性が存在することを示しています。以下のタスクを実行してください。

```
$ docker-compose exec web rails training
```

1 個の spec だけを実行するには

```
$ docker-compose exec web rails training SPEC=spec/vulnerabilities/sql_injection_spec.rb
```

# License

[The MIT License (MIT)](./LICENSE.md)

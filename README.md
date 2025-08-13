# インターン2025

これは次の教材で作られたサンプルアプリケーションです。
[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
（第7版）
[Michael Hartl](https://www.michaelhartl.com/) 著

## ライセンス

[Ruby on Rails チュートリアル](https://railstutorial.jp/)内にある
ソースコードはMITライセンスとBeerwareライセンスのもとで公開されています。
詳細は yasslab/sample_apps リポジトリ内の [LICENSE.md](https://github.com/yasslab/sample_apps/blob/main/LICENSE.md) をご覧ください。
また、ネットワーク応用通信研究所が追加したコードに関する詳細は、本リポジトリの [LICENSE.md](LICENSE.md) をご覧ください。

## 使い方
本リポジトリは、開発環境を以下3つの方法で構築できます。
お手持ちのPCの環境に合わせて選択してください。
- [VSCode DevContainers 環境](#devcontainers-で構築)
- [Docker 環境](#docker環境で構築)
- [ローカル環境](#ローカル環境で構築)

### DevContainers で構築
事前準備：
- Docker のインストール
- Compose のインストール
- VSCode のインストール（拡張機能 DevContainers が必要）

手順：
VSCode でローカルリポジトリを開いた後、右下の通知 、もしくは左下の青いボタンをクリックし、 `Reopen in Container` を実行して開発コンテナを構築する。

ターミナルを開き以下コマンドを実行してDBのセットアップを行う。

```
devcontainers$ bundle exec rails db:create
devcontainers$ bundle exec rails db:migrate
devcontainers$ bundle exec rails db:seed
```

テストを実行してうまく動作するかどうか確認する。

```
devcontainers$ bundle exec rails test
```

以下コマンドを実行してアプリを立ち上げる。

```
devcontainers$ bin/dev
```

[アプリの確認方法](#共通) を実行しブラウザで確認する。


### Docker環境で構築
事前準備：
- Docker のインストール
- Compose のインストール

手順：
以下のコマンドを実行してイメージを構築します。

```
$ docker compose build
```

データベースの作成とマイグレーションを行います。

```
$ docker compose run --rm app bundle exec rails db:create
$ docker compose run --rm app bundle exec rails db:migrate
```

テストを実行してうまく動作するかどうか確認します。

```
$ docker compose run --rm app bundle exec rails test
```

テストが無事パスしたら初期データを投入してRailsサーバを立ち上げます。

```
$ docker compose run --rm app bundle exec rails db:seed
$ docker compose up
```

[アプリの確認方法](#共通) を実行しブラウザで確認する。

### ローカル環境で構築
事前準備：
- 必要なライブラリをインストール

```
$ sudo apt install sqlite3 libsqlite3-dev
```

- RubyGems をインストール

```
$ gem install bundler -v 2.6.9
$ bundle install --without production
```

手順：
データベースの設定ファイルとしてローカル環境用のものを配置します。

```
$ cp config/database.local.yml config/database.yml
```

データベースへのマイグレーションを実行します。

```
$ bin/rails db:migrate
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ bin/rails test
```

テストが無事にパスしたら、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ bin/rails server
```

以下でデータベースへ初期データを投入することができます。

```
$ bin/rails db:seed
```

[アプリの確認方法](#共通) を実行しブラウザで確認する。

### 共通

サーバ立ち上げ後は http://localhost:3000/login にアクセスし、以下の情報でログインします。

- Email: example@railstutorial.org
- Password: foobar

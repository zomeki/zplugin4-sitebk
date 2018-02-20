# Zomekip::Sitebk

ZOMEKIのデータベースをサイト単位でバックアップするプラグインです。

## 想定環境

* ZOMEKI3 build-70+

## インストール

Gemfileに追加します。

```ruby
gem 'zomekip3-sitebk', git: 'https://github.com/zomeki/zomekip3-sitebk.git'
```

以下を実行します。

```bash
$ bundle
```

## 使用方法

サイトID=1のデータをダンプします。

```bash
bundle exec rake zomeki:db:site:dump SITE_ID=1
```

ダンプファイルはHOME/sites/SITE_ID/db以下に保存されます。保存ディレクトリを変更する場合は次のようにします。

```bash
bundle exec rake zomeki:db:site:dump SITE_ID=1 DIR=/path/to/your/dir
```

全サイトのデータをダンプします。

```bash
bundle exec rake zomeki:db:site:dump_all
```

サイトID=1のデータをリストアします。

```bash
bundle exec rake zomeki:db:site:restore SITE_ID=1
```

## バックアップ対象

バックアップ対象は`in_site`スコープが定義済のモデルです。

```ruby
class Cms::Content < ApplicationRecord
  scope :in_site, ...
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

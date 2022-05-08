# ディレクトリ構成

## activemodel_model_sample

このアプリケーションには、`ActiveModel::Model`モジュールを利用した`Person`モデル（リスト12.10）が含まれています。

## activemodel\_\*\_sample.rb

各スクリプトを実行すると、対応する`ActiveModel`のモジュールを試すことのできるコンソールが起動します。  
例えば、`ActiveModel::Attributes`モジュールの挙動を確認したい場合、`ruby activemodel_attributes_sample.rb`を実行します。

```ruby
$ ruby activemodel_attributes_sample.rb
irb(main):001:0> person = Person.new
=> #<Person:0x00007faab1030440 略>
irb(main):002:0> person.name = "David"
=> "David"
irb(main):003:0> person.name
=> "David"
irb(main):004:0> person.age = "40"
=> "40"
irb(main):005:0> person.age
=> 40
```

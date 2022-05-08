# ディレクトリ構成

## concern_sample

このアプリケーションには、`Taggable`モジュール（リスト13.2）とconcernメソッドを利用したルーティングの例（リスト13.11）が含まれています。

## activesupport_concern\_\*\_sample.rb

各スクリプトを実行すると、対応する`ActiveSupport::Concern`の機能を試すことのできるコンソールが起動します。  
例えば、`class_methods`メソッドの挙動を確認したい場合、`ruby activesupport_concern_class_methods_sample.rb`を実行します。

```ruby
$ ruby activesupport_concern_class_methods_sample.rb
irb(main):001:0> Bar = Class.new { include Foo }
=> Bar
irb(main):002:0> Bar.class_method_injected_by_foo
Class method defined in Foo
=> nil
irb(main):003:0> Bar.new.instance_method_injected_by_foo
Instance method defined in Foo
=> nil
```

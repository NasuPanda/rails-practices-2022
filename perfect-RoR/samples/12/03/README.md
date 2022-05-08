# ディレクトリ構成

## activemodel_validator_sample

このアプリケーションには、`ActiveModel::Validator`を利用した`PeriodValidator`（リスト12.20）が含まれています。  
また、このバリデーションルールを利用する`EventRegistrationForm`クラス（リスト12.21）も含まれています。

## form_object_sample

このアプリケーションには、12-3-2で導入した「ユーザーを登録する」というユースケースをフォームオブジェクトを利用して実装する例（リスト12.14〜リスト12.17）が含まれています。  
なお、`email`のフォーマットに関するルールは、`ActiveModel::EachValidator`を利用して定義されています（リスト12.18、リスト12.19）。

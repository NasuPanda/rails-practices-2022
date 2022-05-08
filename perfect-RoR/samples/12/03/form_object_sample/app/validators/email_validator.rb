class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ URI::MailTo::EMAIL_REGEXP
      # addメソッドのオプションにoptions属性のハッシュ（インスタンスの初期化時に渡されたハッシュから
      # 一部のキーを取り除いたもの）を指定することで、バリデーションの設定時にエラーメッセージなどを
      # 上書きする余地を与えられる
      record.errors.add(attribute, :invalid, options.merge(value: value))
    end
  end
end

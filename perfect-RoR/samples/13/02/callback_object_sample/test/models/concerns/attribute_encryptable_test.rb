require "test_helper"
require "minitest/mock"

class AttributeEncryptableTest < ActiveSupport::TestCase
  setup do
    @attribute = :foo
    @callbacks = AttributeEncryptable::Callbacks.new(@attribute)
    @raw = "being encrypted"
  end

  test "should decrypt the specified attribute" do
    encrypted = { @attribute => @raw }.tap(&@callbacks.method(:before_save))[@attribute]

    %i[after_find after_save].each do |callback|
      mock = Minitest::Mock.new
      # 第1〜3引数はそれぞれ、メソッド名、戻り値、期待する引数に対応する
      mock.expect(:[], encrypted, [@attribute])
      mock.expect(:[]=, nil, [@attribute, @raw])

      @callbacks.public_send(callback, mock)

      assert_mock mock
    end
  end

  test "should encrypt the specified attribute" do
    mock = Minitest::Mock.new
    mock.expect(:[], @raw, [@attribute])
    # 暗号化された値が"#{data}--#{digest}"という形式になっていることを検証する
    mock.expect(:[]=, nil, [@attribute, /\A[A-Za-z0-9+\/]+={,2}--.+\z/])

    @callbacks.before_save(mock)

    assert_mock mock
  end
end

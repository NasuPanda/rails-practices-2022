require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "connection accepts" do
    skip "動作させるには app/channels/application_cable/connection.rb のコードを有効にしてください"
    user = User.first
    cookies.signed[:user_id] = user.id
    connect # connectメソッドでコネクションのオープンをシミュレート
    assert_equal connection.current_user.id, user.id
  end

  test "connection rejects" do
    skip "動作させるには app/channels/application_cable/connection.rb のコードを有効にしてください"
    cookies.signed[:user_id] = nil
    assert_reject_connection { connect }
  end
end

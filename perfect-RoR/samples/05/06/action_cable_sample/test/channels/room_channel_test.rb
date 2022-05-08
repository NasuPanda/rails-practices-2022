require 'test_helper'

class RoomChannelTest < ActionCable::Channel::TestCase
  test 'subscribe' do
    subscribe # 購読作成をシミュレート
    assert subscription.confirmed? # subscriptionでRoomChannelオブジェクトを取得できる
    assert_has_stream 'room_channel' # RoomChannel#subscribedメソッドの stream_from で指定したストリーム名
  end

  test 'broadcast' do
    subscribe
    text = "hello"
    broadcast_text = ApplicationController.render(
      partial: 'messages/message',
      locals: { message: Message.new(content: text) }
    )
    assert_broadcast_on('room_channel', message: broadcast_text) do
      perform :speak, message: text
    end
  end
end

class AsyncLogJob < ApplicationJob
  queue_as :default

  # messageを引数に受け取ってAsyncLogモデルを通してDBに保存する
  def perform(message: "hello")
    AsyncLog.create!(message: message)
  end
end

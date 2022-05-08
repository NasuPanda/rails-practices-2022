class AsyncLogJob < ApplicationJob
  queue_as do
    case self.arguments.first[:message]
    when "to async_log"
      :async_log
    else
      :default
    end
  end
  retry_on StandardError, wait: 5.seconds, attempts: 3
  # 複数の例外クラスを指定することも可能
  # retry_on ArgumentError, ZeroDivisionError, wait: 5.seconds, attempts: 3

  # discard_on StandardError do |job, error|
  #   SomeNotifier.push(error)
  # end

  def perform(message: "hello") # message引数を追加
    AsyncLog.create!(message: message) # DBに保存する
  end
end

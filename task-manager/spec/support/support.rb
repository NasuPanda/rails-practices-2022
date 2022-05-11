RSpec.configure do |config|
  # デフォルトはrack_test
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  # JSドライバの設定を `js: true` のみで出来るようにする
  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome
  end
end
class WelcomeController < ApplicationController
  skip_before_action :authenticate

  # 開始日時順にソートした未開催のイベントを取得
  def index
    @events = Event.page(params[:page]).per(10).
      where("start_at > ?", Time.zone.now).order(:start_at)
  end
end

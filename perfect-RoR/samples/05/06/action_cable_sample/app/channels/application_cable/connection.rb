module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # # action_cable/connection/identification.rb#identified_by
    # # 引数で渡されたシンボルをattr_accessorする
    # # 作られたメソッド群はチャネルから呼び出せるようにデリゲートされている
    # # チャネルで呼ぶと、接続しているコネクション（とあるユーザーの接続）のcurrent_userを呼び出せる
    # # https://api.rubyonrails.org/classes/ActionCable/Connection/Base.html
    # identified_by :current_user

    # # とあるユーザーが接続したときに呼ばれる
    # def connect
    #   # identified_byで定義されたattr_accessordの代入メソッド
    #   self.current_user = find_verified_user
    # end

    # # とあるユーザーが切断したときに呼ばれる
    # def disconnect
    #   # Any cleanup work needed when the cable connection is cut.
    # end

    # private

    # def find_verified_user
    #   # 別の場所で cookies.signed[:user_id]が入っている前提
    #   if verified_user = User.find_by(id: cookies.signed[:user_id])
    #     verified_user
    #   else
    #     # ActionCableの接続を切るメソッド
    #     reject_unauthorized_connection
    #   end
    # end
  end
end

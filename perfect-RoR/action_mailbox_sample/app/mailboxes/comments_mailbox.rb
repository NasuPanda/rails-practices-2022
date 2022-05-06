class CommentsMailbox < ApplicationMailbox
  before_processing :validate_request

  def process
    board.comments.create!(body: mail.decoded, creator: commenter)
  end

  def validate_request
    return if commenter && board

    bounce_with CommentMailer.invalid_request(
      inbound_email, commenter: commenter, board: board
    )
  end

  # コメント投稿者となるUserを取得
  def commenter
    return @commenter if defined?(@commenter)
    @commenter = User.find_by(email: mail.from)
  end

  # 書き込み先を取得
  def board
    return @board if defined?(@board)
    @board = Board.find_by(id: mail.to.split("-")[0])
  end
end

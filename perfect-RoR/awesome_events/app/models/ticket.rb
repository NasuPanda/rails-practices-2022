class Ticket < ApplicationRecord
  # user_idがnullの場合があるためoptionalにしておく
  belongs_to :user, optional: true
  belongs_to :event

  validates :comment, length: { maximum: 30 }, allow_blank: true
end

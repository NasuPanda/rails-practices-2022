class Book < ApplicationRecord
  # Enumの定義
  enum sales_status: {
    reservation: 0,   # 予約受付
    now_on_sale: 1,   # 発売中
    end_of_print: 2,  # 販売終了
  }
  scope :costly, -> { where('price > ?', 3000) }
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}%") }

  # 1対多
  belongs_to :publisher
  # 多対多
  has_many :book_authors
  has_many :authors, through: :book_authors

  # バリデーション
  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

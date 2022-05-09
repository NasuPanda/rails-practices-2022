class Task < ApplicationRecord
  belongs_to :user
  attribute :completed, :boolean, default: false

  validates :name, length: { maximum:50 }, presence: true
  validates :description, length: { maximum: 50 }, presence: true
  validates :due_on, presence: true
  validates :completed, inclusion: [true, false]
end

class Person
  include ActiveModel::Model

  attr_accessor :name, :age

  validates :name, presence: true, length: { maximum: 100 }
  validates_numericality_of :age, greater_than_or_equal_to: 0
end

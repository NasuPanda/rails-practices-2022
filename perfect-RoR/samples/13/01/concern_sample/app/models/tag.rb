# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#

class Tag < ApplicationRecord
  validates :name, length: { maximum: 255 }, presence: true, uniqueness: true

  def self.with_name(name)
    where(name: name)
  end
end

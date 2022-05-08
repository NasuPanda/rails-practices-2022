# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  phone_number :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ApplicationRecord
  include AttributeEncryptable

  validates :phone_number, format: { with: /\A0\d{9,10}\z/ }

  encrypt_attributes :phone_number
end

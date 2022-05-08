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
  composed_of :phone_number, mapping: %w[phone_number value]

  # def phone_number
  #   @phone_number ||= PhoneNumber.new(self[:phone_number])
  # end

  # def phone_number=(new_phone_number)
  #   self[:phone_number] = new_phone_number.value
  #   @phone_number = new_phone_number
  # end
end

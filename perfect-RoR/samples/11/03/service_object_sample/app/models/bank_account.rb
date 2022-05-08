# == Schema Information
#
# Table name: bank_accounts
#
#  id         :bigint           not null, primary key
#  balance    :decimal(19, 4)   not null
#  currency   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BankAccount < ApplicationRecord
  composed_of :balance, class_name: "Money", mapping: [%w[balance amount], %w[currency currency]]

  def deposit(money)
    with_lock { update!(balance: balance + money) }
  end

  def withdraw(money)
    with_lock do
      raise "Withdrawal amount must not be greater than balance" if money > balance
      update!(balance: balance - money)
    end
  end
end

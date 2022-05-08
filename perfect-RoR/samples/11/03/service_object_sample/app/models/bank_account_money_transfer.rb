# == Schema Information
#
# Table name: bank_account_money_transfers
#
#  id         :bigint           not null, primary key
#  from_id    :bigint           not null
#  to_id      :bigint           not null
#  amount     :decimal(19, 4)   not null
#  currency   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BankAccountMoneyTransfer < ApplicationRecord
  composed_of :money, mapping: [%w[amount amount], %w[currency currency]]

  belongs_to :from, class_name: "BankAccount"
  belongs_to :to, class_name: "BankAccount"

  validate :attributes_can_be_represented_as_money

  before_create :transfer_money

  private

  def attributes_can_be_represented_as_money
    # 1. Moneyオブジェクトを初期化できるかどうかを確かめる
    money
  rescue
    # 2. 何らかのエラーが発生した場合、対応するモデルの属性（amount、currency）の値が不正であると
    # みなす。ここでは、ActiveRecord::Base.reflect_on_aggregationメソッドを利用して、これらの
    # 属性名を動的に取得している
    self.class.reflect_on_aggregation(:money).mapping.each do |attribute, _|
      errors.add(attribute, :invalid)
    end
  end

  def transfer_money
    from.withdraw(money)
    to.deposit(money)
  end
end

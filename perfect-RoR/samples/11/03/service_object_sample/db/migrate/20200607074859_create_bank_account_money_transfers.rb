class CreateBankAccountMoneyTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_account_money_transfers do |t|
      t.references :from, null: false, foreign_key: { to_table: :bank_accounts }
      t.references :to, null: false, foreign_key: { to_table: :bank_accounts }
      t.decimal :amount, precision: 19, scale: 4, null: false
      t.string :currency, null: false

      t.timestamps
    end
  end
end

require "application_system_test_case"

class BankAccountMoneyTransfersTest < ApplicationSystemTestCase
  setup do
    @bank_account_money_transfer = bank_account_money_transfers(:one)
  end

  test "visiting the index" do
    visit bank_account_money_transfers_url
    assert_selector "h1", text: "Bank Account Money Transfers"
  end

  test "creating a Bank account money transfer" do
    visit bank_account_money_transfers_url
    click_on "New Bank Account Money Transfer"

    fill_in "Amount", with: @bank_account_money_transfer.amount
    fill_in "Currency", with: @bank_account_money_transfer.currency
    fill_in "From", with: @bank_account_money_transfer.from_id
    fill_in "To", with: @bank_account_money_transfer.to_id
    click_on "Create Bank account money transfer"

    assert_text "The money was successfully transferred"
    click_on "Back"
  end
end

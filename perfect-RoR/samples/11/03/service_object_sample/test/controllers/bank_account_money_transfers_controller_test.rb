require 'test_helper'

class BankAccountMoneyTransfersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_account_money_transfer = bank_account_money_transfers(:one)
  end

  test "should show bank_account_money_transfer" do
    get bank_account_money_transfer_url(@bank_account_money_transfer)
    assert_response :success
  end
end

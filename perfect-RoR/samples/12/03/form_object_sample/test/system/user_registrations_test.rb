require "application_system_test_case"

class UserRegistrationsTest < ApplicationSystemTestCase
  test "registering a User" do
    visit new_user_registration_url

    password = "password"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    check "Terms of Service"
    click_on "Submit"

    assert_text "User was successfully registered"
  end
end

require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Email", with: "test@example.com"
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end
end

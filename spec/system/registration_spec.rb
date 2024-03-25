require "rails_helper"

RSpec.describe "Registration", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "allows users to sign up" do
    visit new_user_registration_path
    fill_in "Username", with: "testuser"
    fill_in "Email", with: "user@example.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    expect do
      click_button "Sign up"
    end.to change(User, :count).by(1)

    expect(current_path).to eq(root_path)
    expect(page).to have_text("You can create a new room or join an existing chat room.")
  end
end

require "rails_helper"

RSpec.describe "Registration", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "allows users to sign up" do
    user = create(:user)
    sign_in_as(user)
    click_link "Sign out"
    expect(current_path).to eq(new_user_session_path)
  end
end

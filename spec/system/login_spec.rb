require "rails_helper"

RSpec.describe "Login", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "allows users to sign up" do
    user = create(:user)
    sign_in_as(user)
    expect(current_path).to eq(root_path)
    expect(page).to have_text("You can create a new room or join an existing chat room.")
  end
end

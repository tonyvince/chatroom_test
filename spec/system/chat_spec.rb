require "rails_helper"

RSpec.describe "Login", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "allows users to sign up" do
    user = create(:user)
    login_as(user)
    visit root_path
    expect(page).to have_text("You can create a new room or join an existing chat room.")
    fill_in "room_name", with: "MyRoom"
    expect do
      click_button "Create Room"
    end.to change(Room, :count).by(1)
    visit rooms_path
    expect(page).to have_text("MyRoom")
    click_link "Join"
    fill_in "room_message_message", with: "Hello, World!"
    expect do
      click_button "Send message"
    end.to change(RoomMessage, :count).by(1)
  end
end

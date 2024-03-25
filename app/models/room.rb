class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy,
    inverse_of: :room
  after_create_commit { broadcast_append_to "rooms" }
end

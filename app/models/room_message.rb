class RoomMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room, inverse_of: :room_messages
  after_create_commit { broadcast_append_to room }
end

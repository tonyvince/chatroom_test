module ApplicationHelper
  include Pagy::Frontend

  def gravatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end
end

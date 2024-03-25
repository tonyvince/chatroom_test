# This will guess the User class
FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username }
    email { Faker::Internet.unique.email }
    password { "Password" }
    password_confirmation { "Password" }
  end
end

FactoryBot.define do
  factory :user do
    first_name { "Doe" }
    last_name  { "John" }
    sequence(:email) { |n| "johndoe#{n}@live.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end

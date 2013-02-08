FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@slackermeals.com" }
    password "password"
    password_confirmation "password"
  end
end

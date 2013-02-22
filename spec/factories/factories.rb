FactoryGirl.define do
  factory :user, class: User do |f|
    password =  Faker::Company.catch_phrase
    f.email                 { Faker::Internet.email }
    f.password              { password }
    f.password_confirmation { password }
  end
end

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:password) { |n| "secret#{n}" }
  end
end

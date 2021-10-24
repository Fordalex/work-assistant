FactoryBot.define do
  factory :ticket do
    association :user
    association :category
  end
end

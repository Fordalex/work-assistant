FactoryBot.define do
  factory :user_group do
    association :collection
    association :user
  end
end

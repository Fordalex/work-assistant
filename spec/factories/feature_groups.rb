FactoryBot.define do
  factory :feature_group do
    association :ticket
    association :feature
  end
end

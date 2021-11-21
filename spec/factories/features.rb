FactoryBot.define do
  factory :feature do
    association :feature_type
    feature_ticket_type { "Select" }
  end
end

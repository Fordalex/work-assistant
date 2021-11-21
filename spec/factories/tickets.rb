FactoryBot.define do
  factory :ticket do
    description { "The description" }
    start_time { Time.now }
    duration { 100 }
    association :collection
  end
end

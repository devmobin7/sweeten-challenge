FactoryBot.define do
  factory :renovation_project do
    longitude { Faker::Number.between(-180.00, 180.00) }
    latitude { Faker::Number.between(-90.00, 90.00) }
    min_budget { Faker::Number.between(32000.00, 99000.00) }
    max_budget { Faker::Number.between(32000.00, 99000.00) }
    design_services { Faker::Boolean.boolean }
    build_services { Faker::Boolean.boolean }
  end
end

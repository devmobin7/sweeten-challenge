FactoryBot.define do
  factory :general_contractor do
    longitude { Faker::Number.between(-180.00, 180.00) }
    latitude { Faker::Number.between(-90.00, 90.00) }
    min_budget { Faker::Number.between(32000.00, 99000.00) }
    max_budget { Faker::Number.between(32000.00, 99000.00) }
    design_services { Faker::Boolean.boolean }
    build_services { Faker::Boolean.boolean }
    rating { Faker::Number.between(1, 5) }
    project_count { Faker::Number.digit }
  end
end

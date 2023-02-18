FactoryBot.define do
  factory :contract do
    # general_contractor_id { Faker::Number.between(1, 10) }
    # renovation_project_id { Faker::Number.between(1, 10) }
    general_contractor
    renovation_project
    status { [:started, :closed].sample }
    rating { Faker::Number.between(1, 5) }
  end
end

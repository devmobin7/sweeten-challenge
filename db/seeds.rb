require 'faker'
I18n.reload!

puts ''

print 'Creating General Contractors'
10.times do
  print "."
  general_contractor = GeneralContractor.first_or_create!(
    longitude: Faker::Number.decimal(2),
    latitude: Faker::Number.decimal(2),
    min_budget: Faker::Number.decimal(3),
    max_budget: Faker::Number.decimal(3),
    design_services: Faker::Boolean.boolean,
    build_services: Faker::Boolean.boolean
  )
  general_contractor.save
end

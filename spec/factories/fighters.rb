FactoryGirl.define do
  factory :fighter do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    nickname { Faker::Superhero.name }
  end
end

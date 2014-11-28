# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    name {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    phone {Faker::PhoneNumber.phone_number}
    gender 1
    status 1
  end
end

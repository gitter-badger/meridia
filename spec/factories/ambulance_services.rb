# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ambulance_service do
    policy_numbre "MyString"
    company "MyString"
    phone1 "MyString"
    phone2 "MyString"
  end
end

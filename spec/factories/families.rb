# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :family do
    firstname "MyString"
    lastname "MyString"
    relationship "MyString"
    phone_home "MyString"
    address "MyString"
    phone_mobile "MyString"
  end
end

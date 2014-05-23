# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    type ""
    observation "MyString"
    call "MyString"
    visit "MyString"
    event_date "MyString"
  end
end

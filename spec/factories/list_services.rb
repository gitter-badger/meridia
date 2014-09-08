# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list_service, :class => 'ListServices' do
    date_service ""
    name "MyString"
    price ""
    description "MyString"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :permission, :class => 'Permissions' do
    name "MyString"
    action "MyString"
    subject_class "MyString"
  end
end

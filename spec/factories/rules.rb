# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rule do
    field 1
    type 1
    value_start "MyString"
    value_end "MyString"
  end
end

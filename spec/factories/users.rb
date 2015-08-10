FactoryGirl.define do
  factory :user do
    username 'WhoAmI'
    first_name "John"
    last_name "Doe"
    email "mysteryman@example.com"
    password "123456"
  end
end

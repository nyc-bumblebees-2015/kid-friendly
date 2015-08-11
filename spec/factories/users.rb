FactoryGirl.define do
  factory :user do
    sequence (:username) {|n| "WhoAmI#{n}"}
    first_name "John"
    last_name "Doe"
    sequence (:email) {|n| "mysteryman#{n}@example.com"}
    password "123456"
  end
end

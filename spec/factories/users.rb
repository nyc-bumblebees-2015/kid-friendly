FactoryGirl.define do
  factory :user do
    first_name "Jane"
    last_name "Dog"
    email "janedog@example.com"
    password "123456"
    
    factory :invalid_user do
      email nil
    end    
  end
end
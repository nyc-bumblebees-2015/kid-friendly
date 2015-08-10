FactoryGirl.define do
  factory :user do
    username 'WhoAmI'
    first_name "John"
    last_name "Doe"
    email "mysteryman@example.com"
    password "123456"

    factory :dup_username_user do
      first_name "Jose"
      last_name "Sue"
      email "josesue@example.com"
    end

    factory :dup_email_user do
      username 'AppsAllDay'
      first_name "Johnny"
      last_name "Apple"
    end

  end
end

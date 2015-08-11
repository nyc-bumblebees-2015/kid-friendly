FactoryGirl.define do
  factory :review do
    association :location
    association :user
    overall_rating 5

    factory :complete_review do
      cleanliness_rating 5
      spaciousness_rating 5
      body "This was the best!\nThe greatest place ever!"
    end

    factory :review_without_user do
      user nil
    end
  end
end

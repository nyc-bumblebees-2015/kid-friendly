FactoryGirl.define do
  factory :like do
    factory :valid_like do
      association :user
      association :review
    end

    factory :like_without_user do
      association :review
    end

    factory :like_without_review do
      association :user
    end
  end
end

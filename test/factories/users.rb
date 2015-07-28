FactoryGirl.define do
  factory :user do
    email
    password { generate :string }
    password_confirmation { password }

    trait :admin do
      role :admin
    end
  end
end

FactoryGirl.define do
  factory :user do
    email
    login { generate :string }
    password { generate :string }
    password_confirmation { password }

    trait :admin do
      role :admin
    end
  end
end

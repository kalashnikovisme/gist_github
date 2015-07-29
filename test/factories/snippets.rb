FactoryGirl.define do
  factory :snippet do
    title { generate :string }
    body { generate :string }
    user_id { User.last ? User.last.id : 1 }
  end
end

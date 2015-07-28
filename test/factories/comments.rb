FactoryGirl.define do
  factory :comment do
    user_id { User.last ? User.last.id : 1 }
    body { generate :string }
    snippet_id { Snippet.last ? Snippet.last.id : 1 }
  end
end

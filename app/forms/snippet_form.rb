class SnippetForm < ApplicationForm
  attributes :title, :body, :user_id, require: true
end

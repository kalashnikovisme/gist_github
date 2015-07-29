class SnippetForm < ApplicationForm
  attributes :title, :body, :user_id, required: true
end

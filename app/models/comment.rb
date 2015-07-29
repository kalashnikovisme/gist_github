class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet

  validates :body, presence: true
  validates :snippet_id, presence: true
  validates :user_id, presence: true
end

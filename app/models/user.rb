class User < ActiveRecord::Base
  has_secure_password validations: false

  has_many :snippets

  validates :email, email: true,
                    uniqueness: true
  validates :role, presence: true

  extend Enumerize
  enumerize :role, in: [ :user, :admin ], default: :user
end

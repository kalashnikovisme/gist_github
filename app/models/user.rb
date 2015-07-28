class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :email, email: true,
                    uniqueness: true
  validates :role, presence: true

  extend Enumerize
  enumerize :role, in: [ :user, :admin ], default: :user
end

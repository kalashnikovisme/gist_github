class UserForm < ApplicationForm
  self.main_model = :user

  attributes :role, :email, :login, required: true
  attributes :patronymic, :password
end

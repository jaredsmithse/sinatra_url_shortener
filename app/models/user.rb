class User < ActiveRecord::Base
  validates :email, :first_name, :presence => true
  validates :email, :uniqueness => true
end

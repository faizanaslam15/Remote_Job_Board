class User < ApplicationRecord
  has_secure_password
  has_many :jobs
  validates :email, presence: true, uniqueness: true
end

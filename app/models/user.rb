class User < ApplicationRecord
  validates :first_name, :last_name, :age, :description,
    presence: true
    
  validates :email, 
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  belongs_to :city
  has_many :gossips
end

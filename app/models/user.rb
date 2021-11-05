class User < ApplicationRecord
  validates :first_name, :last_name, :age, :description,
    presence: true
    
  validates :email, 
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  validates :password, allow: nil
  has_secure_password

  belongs_to :city
  has_many :gossips
  has_many :likes

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update!(remember_digest: remember_digest)
  end
end

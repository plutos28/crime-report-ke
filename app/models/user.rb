class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reports

  # Ensure email is present and unique
  validates :email, presence: true, uniqueness: true
  # Ensure password is at least 6 characters long
  validates :password, presence: true, length: { minimum: 6 }
end

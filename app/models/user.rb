class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tasks, dependent: :destroy
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :scores
  has_one_attached :photo

  validates :firstName, :lastName, :email, :password, presence: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }, uniqueness: true
end

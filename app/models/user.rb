class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name,
  presence: true,
  length: { in: 2..20 }

	validates :email,
	presence: true

	validates :encrypted_password,
	presence: true

  validates :introduction,
  length: { maximum: 50 }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books ,dependent: :destroy
  attachment :profile_image
end

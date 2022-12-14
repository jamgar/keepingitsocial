class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :page, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :username, uniqueness: true

  after_create do
    create_page
    create_profile
  end
end

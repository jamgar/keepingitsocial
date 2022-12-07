class Page < ApplicationRecord
  belongs_to :user

  has_one :theme, dependent: :destroy
  has_many :elements, dependent: :destroy

  after_create do
    create_theme 
  end
end

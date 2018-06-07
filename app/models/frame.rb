class Frame < ApplicationRecord
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :image, presence:true
  
end

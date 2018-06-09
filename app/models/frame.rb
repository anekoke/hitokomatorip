class Frame < ApplicationRecord
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :image, presence:true
  
  has_many :relationships
  has_many :users, through: :relationships
  has_many :interests
  has_many :interest_users, through: :interests, class_name: 'User', source: :user
  has_many :visits
  has_many :visit_users, through: :visits, class_name: 'User', source: :user
  
end

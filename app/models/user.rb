class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:twitter]
         
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth[:uid],
        provider: auth[:provider],
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        name:     auth[:info][:name],
        nickname: auth[:info][:nickname],
        image_url: auth[:info][:image],
        twitter_url: auth[:info][:urls][:Twitter]
      )
    end

    user
  end
  
  has_many :relationships
  has_many :frames, through: :relationships
  has_many :interests
  has_many :interest_frames, through: :interests, class_name: 'Frame', source: :frame
  has_many :visits
  has_many :visit_frames, through: :visits, class_name: 'Frame', source: :frame
  
  def interest(frame)
    self.interests.find_or_create_by(frame_id: frame.id)
  end
  
  def uninterest(frame)
    interest = self.interests.find_by(frame_id: frame.id)
    interest.destroy if interest
  end
  
  def interest?(frame)
    self.interest_frames.include?(frame)
  end
  
  def visit(frame)
    self.visits.find_or_create_by(frame_id: frame.id)
  end
  
  def unvisit(frame)
    visit = self.visits.find_by(frame_id: frame.id)
    visit.destroy if visit
  end
  
  def visit?(frame)
    self.visit_frames.include?(frame)
  end
  

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
  
end
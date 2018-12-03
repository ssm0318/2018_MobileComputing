class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  has_many    :bookmarks, dependent: :destroy

  has_many    :events, dependent: :destroy, :foreign_key => "host_id"

  has_many    :event_attendings

  has_many    :event_waitings

  has_many    :event_requests

  # follow 
  has_many    :followed_follows, :class_name => "Follow", :foreign_key => "following_id", dependent: :destroy
  has_many    :followers, :through => :followed_follows, dependent: :destroy

  has_many    :following_follows, :class_name => "Follow", :foreign_key => "follower_id", dependent: :destroy
  has_many    :followings, :through => :following_follows, dependent: :destroy
  
  # review
  has_many    :written_reviews, :class_name => "Review", :foreign_key => "author_id", dependent: :destroy
  has_many    :hosts, :through => :written_reviews, dependent: :destroy

  has_many    :received_reviews, :class_name => "Review", :foreign_key => "host_id", dependent: :destroy
  has_many    :authors, :through => :received_reviews, dependent: :destroy

  # profile
  has_one     :profile, dependent: :destroy



  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      email = auth.info.email
      user = User.where(:email => email).first

      unless self.where(email: auth.info.email).exists?
        if user.nil?
          if auth.provider == "kakao"
            user = User.create(password: Devise.friendly_token[0,20])
            profile = Profile.create(user_id: user.id, profile_pic: auth.info.image, isVerified: true)
          end
        end
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user

  end

  def email_required?
    false
  end
end

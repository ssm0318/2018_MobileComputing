class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many    :bookmarks, dependent: :destroy

  has_many    :events, dependent: :destroy, :foreign_key => "host_id"

  has_many    :event_attendings

  has_many    :event_waitings

  has_many    :event_requests

  # # event requests
  # has_many :received_requests, :class_name => "EventRequest", :foreign_key => "requested_id", dependent: :destroy
  # has_many :requesters, through: :received_requests, dependent: :destroy

  # has_many :made_requests, :class_name => "EventRequest", :foreign_key => "requester_id", dependent: :destroy
  # has_many :requesteds, through: :made_requests, dependent: :destroy  

  # # event waiting
  # has_many    :event_waitings, :class_name => "EventWaiting", :foreign_key => "host_id", dependent: :destroy
  # has_many    :waiters, :through => :event_waitings, dependent: :destroy

  # has_many    :waiting_events, :class_name => "EventWaiting", :foreign_key => "waiter_id", dependent: :destroy
  # has_many    :hosts, :through => :waiting_events, dependent: :destroy

  # follow
  has_many    :followed_follows, :class_name => "Follow", :foreign_key => "followed_id", dependent: :destroy
  has_many    :followers, :through => :followed_follows, dependent: :destroy

  has_many    :following_follows, :class_name => "Follow", :foreign_key => "follower_id", dependent: :destroy
  has_many    :following, :through => :following_follows, dependent: :destroy
  
  # review
  has_many    :written_reviews, :class_name => "Review", :foreign_key => "author_id", dependent: :destroy
  has_many    :hosts, :through => :written_reviews, dependent: :destroy

  has_many    :received_reviews, :class_name => "Review", :foreign_key => "host_id", dependent: :destroy
  has_many    :authors, :through => :received_reviews, dependent: :destroy

  # profile
  has_one     :profile, dependent: :destroy
end

class Profile < ApplicationRecord
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :profile_latitude,
                   :lng_column_name => :profile_longitude

  mount_uploader              :profile_pic, ProfilePicUploader
  belongs_to                  :user
  has_and_belongs_to_many     :profile_tags, dependent: :destroy

  # after_create :add_default_profile_pic

  scope :search_profile, -> (keyword) { joins(:tags).where("content LIKE ? ", "%#{keyword}%") }

  # private

  # def add_default_profile_pic
  #   random = rand(1..5)
  #   self.profile_pic = Rails.root.join("app/assets/images/profile" + random.to_s + ".png").open
  #   self.save!
  # end
end

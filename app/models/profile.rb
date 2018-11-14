class Profile < ApplicationRecord
    mount_uploader              :profile_pic, ProfilePicUploader
    has_and_belongs_to_many     :tags, dependent: :destroy
    belongs_to                  :user

    after_create :add_default_profile_pic

    scope :search_profile, -> (keyword) { joins(:tags).where("content LIKE ? ", "%#{keyword}%") }

    private
  
    def add_default_profile_pic
      random = rand(1..5)
      self.profile_pic = Rails.root.join("app/assets/images/profile" + random.to_s + ".png").open
      self.save!
    end
end

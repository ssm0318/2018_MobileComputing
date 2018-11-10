class Profile < ApplicationRecord
    mount_uploader              :profile_pic, ProfilePicUploader
    has_and_belongs_to_many     :tags
    belongs_to                  :user
end

class Follow < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"

    after_create :create_notifications

    private

    def create_notifications
        Notification.create(recipient: self.followed, actor: self.follower, target: self)
    end
end

class Review < ApplicationRecord
    belongs_to :host, class_name: "User"
    belongs_to :author, class_name: "User"

    after_create :create_notifications

    private

    def create_notifications
        Notification.create(recipient: self.host, actor: self.author, target: self)
    end
end

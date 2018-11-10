class EventAttending < ApplicationRecord
    belongs_to :event
    belongs_to :user

    after_create :create_notifications, :delete_request 

    private

    def create_notifications
        Notification.create(recipient: self.user, actor: self.event.host, target: self)
    end

    def delete_request
        f = EventRequest.where(requester: self.user, event: self.event)
        f.destroy_all
    end
end

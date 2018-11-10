class EventWaiting < ApplicationRecord
    belongs_to :event
    belongs_to :waiter, class_name: "User"

    after_create :create_notifications, :delete_request 

    private

    def create_notifications
        Notification.create(recipient: self.waiter, actor: self.event.host, target: self)
    end

    def delete_request
        f = EventRequest.where(requester: self.waiter, event: self.event)
        f.destroy_all
    end
end

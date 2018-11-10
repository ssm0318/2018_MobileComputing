class Event < ApplicationRecord
    belongs_to :host, class_name: "User"
    has_many   :event_attendings
    has_many   :event_requests
    has_many   :event_waitings
end

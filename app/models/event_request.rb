class EventRequest < ApplicationRecord
    belongs_to :event
    belongs_to :requester, class_name: "User"
end

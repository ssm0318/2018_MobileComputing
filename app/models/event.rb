class Event < ApplicationRecord
    acts_as_mappable :default_units => :kms,
                     :default_formula => :sphere,
                     :distance_field_name => :distance,
                     :lat_column_name => :event_latitude,
                     :lng_column_name => :event_longitude

    belongs_to :host, class_name: "User"
    has_many   :event_attendings
    has_many   :event_requests
    has_many   :event_waitings

    scope :search_event, -> (keyword) { where('title LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%") }
end

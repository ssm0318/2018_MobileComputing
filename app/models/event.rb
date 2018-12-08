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
    has_and_belongs_to_many     :tags, dependent: :destroy

    scope :search_event, -> (keyword) { joins(:tags).where("content LIKE ? ", "%#{keyword}%") or wehre('title LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%") }
end

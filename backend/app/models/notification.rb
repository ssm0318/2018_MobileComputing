class Notification < ApplicationRecord
    belongs_to :recipient, class_name: 'User'
    belongs_to :actor, class_name: 'User'
    belongs_to :target, polymorphic: true
    # https://guides.rubyonrails.org/association_basics.html#polymorphic-associations 참조

    scope :unread, -> { where(read_at: nil) }
end

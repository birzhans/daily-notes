class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscriber, class_name: 'User'

  validates :user_id, uniqueness: { scope: :subscriber_id }
end

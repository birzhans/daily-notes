class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscriber, class_name: 'User'

  validates :user_id, uniqueness: { scope: :subscriber_id }
  validate :not_self_subscribing

  private

  def not_self_subscribing
    if user_id == subscriber_id
      errors.add(:user_id, 'cannot subscribe to self')
    end
  end
end

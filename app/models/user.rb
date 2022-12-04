class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :notes, dependent: :destroy

  has_many :subscriptions, foreign_key: :subscriber_id, dependent: :destroy
  has_many :followings, through: :subscriptions, source: :user

  has_many :inverse_subscriptions, class_name: 'Subscription', foreign_key: :user_id, dependent: :destroy
  has_many :subscribers, through: :inverse_subscriptions, source: :subscriber

  def notes_count
    notes.count
  end

  def joined
    created_at.strftime('%e %B, %Y')
  end    
end

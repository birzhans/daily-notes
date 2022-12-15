class Note < ApplicationRecord
  belongs_to :user
  delegate :username, to: :user

  validates :body, :date, presence: true
  validates :date, uniqueness: { scope: :user_id }
  validate :date_cannot_be_in_the_future

  scope :ordered, -> { order(date: :desc) }

  private

  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end
end

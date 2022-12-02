class Note < ApplicationRecord
  belongs_to :user

  validates :body, :date, presence: true

  scope :ordered, -> { order(date: :desc) }
end

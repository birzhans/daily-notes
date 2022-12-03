class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :notes, dependent: :destroy

  def notes_count
    notes.count
  end

  def joined
    created_at.strftime('%e %B, %Y')
  end
end

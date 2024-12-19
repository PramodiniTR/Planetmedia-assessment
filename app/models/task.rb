class Task < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :due_date, presence: true
  validate :due_date_cannot_be_in_the_past
  enum :status,[ :pending, :in_progress, :completed ]

  private

  def due_date_cannot_be_in_the_past
    errors.add(:due_date, "can't be in the past") if due_date.present? && due_date < Date.today
  end
end

  class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :user_id, presence: true
  validates :category, presence: true 
  validates :amount, numericality: { greater_than: 0 }
  validates :concept, presence: true
  validate :date_cant_be_nil

  def date_cant_be_nil
    if self.date.nil?
      self.date = Time.now
    end
  end

end

class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :transaction_type

  validates :user_id, presence: true
  validates :category, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :concept, presence: true
  validate :date_cant_be_nil
  validates :transaction_type, presence: true

  scope :for_category_and_amount, ->(_category, _amount) {
     joins(:category)
     .where("categories.name = ? and expenses.amount < ?", _category, _amount)
  }

  scope :last_sixt_months, -> {where("date >= ?", 6.months.ago)}
  scope :for_a, -> {where(category_id: 1) }

  scope :for_b, ->(marcela) {where(category_id: marcela) }
  scope :a, -> { where("date >= ?", Time.now.beginning_of_month) }
  scope :group_a, -> {  lambda { group_by { |expense| expense.category.name  } } }

  def self.total_spent_by_user
    select(:amount).where(user_id: 1).pluck(:amount).sum
  end

  def date_cant_be_nil
    if self.date.nil?
      self.date = Time.now
    end
  end

end

class TransactionType < ApplicationRecord
  validates :name, uniqueness: true
  has_many :expenses
end

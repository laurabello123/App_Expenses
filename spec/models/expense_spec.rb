require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "The expense exist" do
    it "should belong to user" do
      expense =   Expense.new()
    end
  end
end

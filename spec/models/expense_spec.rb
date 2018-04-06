require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "The expense exist" do
    it "should belong to user" do
      time = Time.now.freeze
      user = User.create(email: "laura.bj94@hotmail.com")
      expense =  Expense.new(amount:3000, concept: "Uber", date: time, user_id: user)
      expect(expense.valid?).to eq(true)
    end
  end
end

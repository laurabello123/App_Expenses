
require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "The expense exists" do

    it "should belong to a user" do
      time = Time.now.freeze
      user_1 = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
      @category = FactoryBot.create(:category)
      @transaction_type = FactoryBot.create(:transaction_type)
      expense_1 = Expense.new(amount: 30000, concept: "Uber", date: time, user: user_1, category: @category, transaction_type: @transaction_type)


      expect(expense_1.valid?).to eq(true)
      puts expense_1.errors.messages.inspect
      expect(expense_1.save!).to eq(true)
      expect(Expense.count).to eq(1)
      expect(user_1.expenses).to eq([expense_1])
      expect(expense_1.user).to eq(user_1)
    end

    context "amount related" do
      before do
        time = Time.now.freeze
        user_1 = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @category = FactoryBot.create(:category)
        @transaction_type = FactoryBot.create(:transaction_type)
        @expense_1 = Expense.new(concept: "Uber", date: time, user: user_1, category: @category, transaction_type: @transaction_type)
      end

      context "the amount is negative" do
        it "should not save the expense" do
          @expense_1.amount = -200
          expect(@expense_1.valid?).to be_falsey
          expect(@expense_1.save).to be_falsey
          expect(@expense_1.errors.messages).not_to be_empty
        end
      end

      context "the amount is positive" do
        it "should save the expense" do

          @expense_1.amount = 20000
          expect(@expense_1.valid?).to be_truthy
          expect(@expense_1.save).to be_truthy
          expect(@expense_1.errors.messages).to be_empty
        end
      end
    end
    context "concept related" do
      before do
        time = Time.now.freeze
        user_1 = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @transaction_type = FactoryBot.create(:transaction_type)
        @category = FactoryBot.create(:category)
        @expense_1 = Expense.new(amount: 20000, date: time, user: user_1, category: @category, transaction_type: @transaction_type)
      end

      context "the concept is empty" do
        it "should not save the expense and show an error" do
          expect(@expense_1.valid?).to be_falsey
          expect(@expense_1.save).to be_falsey
          expect(@expense_1.errors.messages).not_to be_empty
        end
      end

      context "the concept is not empty" do
        it "should save the expense" do
          @expense_1.concept = "Uber"
          expect(@expense_1.concept).to eq("Uber")
          expect(@expense_1.valid?).to be_truthy
          expect(@expense_1.save).to be_truthy
          expect(@expense_1.errors.messages).to be_empty
        end
      end
    end
    context "date related" do
      before do
        user_1 = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @transaction_type = FactoryBot.create(:transaction_type)
        @category = FactoryBot.create(:category)
        @expense_1 = Expense.new(amount: 20000, concept: "Uber", user: user_1, category: @category, transaction_type: @transaction_type)
      end

      context "the date is empty" do
        it "should save the expense and set the current date on the date field" do
          expect(@expense_1.save).to be_truthy
          expect(@expense_1.date).not_to be_nil
          expect(@expense_1.errors.messages).to be_empty
        end
      end

      context "the date is not empty" do
        it "should save the expense" do
          time = Time.now.freeze
          @expense_1.date = time
          expect(@expense_1.valid?).to be_truthy
          expect(@expense_1.save).to be_truthy
          expect(@expense_1.date).to eq(time)
          expect(@expense_1.errors.messages).to be_empty
        end
      end
    end

    context "category exists" do
      before do
        time = Time.now.freeze
        user_1 = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @transaction_type = FactoryBot.create(:transaction_type)
        @category = FactoryBot.create(:category)
        @expense_1 = Expense.new(amount: 20000, concept: "Uber", user: user_1, date: time, transaction_type: @transaction_type)
      end

      context "the category is empty" do
        it "should not save the expense and tell te user to choose a category" do
          expect(@expense_1.save).to be_falsey
          expect(@expense_1.errors.messages).not_to be_empty
          expect(@expense_1.valid?).to be_falsey
        end
      end

      context "the category is not empty" do
        it "should save the expense" do
          @expense_1.category = @category
          expect(@expense_1.valid?).to be_truthy
          expect(@expense_1.save).to be_truthy
          expect(@expense_1.errors.messages).to be_empty
        end
      end
    end

    context ".nombre_methodo" do
    end

    context "#date_cant_be_nil" do
    end

    context "transaction_type exists" do
      before do
        time = Time.now.freeze
        user_1 = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @category = FactoryBot.create(:category)
        @transaction_type = FactoryBot.create(:transaction_type)
        @expense_1 = Expense.new(amount: 20000, concept: "Uber", user: user_1, date: time, category: @category)
      end

      context "the transaction_type is empty" do
        it "should not save the expense and tell te user to choose a transaction_type" do
          expect(@expense_1.save).to be_falsey
          expect(@expense_1.errors.messages).not_to be_empty
          expect(@expense_1.valid?).to be_falsey
        end
      end

      context "the transaction_type is not empty" do
        it "should save the expense" do
          @expense_1.transaction_type = @transaction_type
          expect(@expense_1.valid?).to be_truthy
          expect(@expense_1.save).to be_truthy
          expect(@expense_1.errors.messages).to be_empty
        end
      end
    end
  end
end

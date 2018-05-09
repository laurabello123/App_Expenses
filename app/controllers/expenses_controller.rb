class ExpensesController < ApplicationController

 def index

     transaction_type = params["transaction_type"]
     category = params[:category]

     if transaction_type && !category
         @expenses = Expense.joins(:transaction_type).where("transaction_types.name = ?", transaction_type.capitalize)
     elsif category && !transaction_type
         @expenses = Expense.joins(:category).where("categories.name = ?", category.capitalize)
     elsif category && transaction_type
         @expenses = Expense.joins(:transaction_type, :category).where("transaction_types.name = ? AND categories.name = ?",
         transaction_type.capitalize, category.capitalize)
     else
         @expenses = Expense.all
     end

     @transaction_types = TransactionType.all
     @category = Category.all

     respond_to do |format|
         format.html { render :index}
         format.json { render json: @expenses, status: :ok}
         format.js {render partial: "expenses_list", locals: { expenses: @expenses }}
     end

 end

end

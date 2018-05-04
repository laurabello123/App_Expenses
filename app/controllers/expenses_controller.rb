class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    respond_to do |format|
    format.html { render :index}
    format.html { render json: @expenses, status: ok}
  end
end

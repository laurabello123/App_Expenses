# This library allows to show a resume of the total of expenes of a user during differens periods: Last six months, by day, by cathegory and comparate two last months

class DashboardHandler

  def initialize(expenses)
    @expenses = expenses
  end

  def today_expenses
    @expenses.daily_expenses.pluck(:amount).sum
  end

  def yesterday_expenses
     @expenses.one_day_ago_expenses.pluck(:amount).sum
  end

  def this_month_expenses
    @expenses.this_month.pluck(:amount).sum
  end

   def last_month_expenses
      @expenses.one_month_ago_expenses.pluck(:amount).sum
   end

  def transaction_type_for_last_six_months

  end

  def current_month_expenses_by_transaction_type
  end

  def current_moth_expenses_by_category
  end

  def accumulated_against_last_month
  end
end

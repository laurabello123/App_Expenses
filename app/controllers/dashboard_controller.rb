class DashboardController < ApplicationController
  def index
    current_user.expenses
  end
end

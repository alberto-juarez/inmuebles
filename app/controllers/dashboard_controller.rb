class DashboardController < ApplicationController
  before_action :set_sidebar
  def index
  end

  def properties
  end

  def reports
  end

  def profile
    @account = Account.find(params[:id])
  end

  def set_sidebar
    @show_sidebar = true
  end
end

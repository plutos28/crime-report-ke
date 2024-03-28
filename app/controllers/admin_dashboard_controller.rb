class AdminDashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reports = Report.all
  end

  def data_dashboard

  end
end

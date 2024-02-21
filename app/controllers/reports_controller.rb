class ReportsController < ApplicationController
    before_action :authenticate_user!

    def index 
        @reports = Report.all
    end

    def new
        @report = Report.new
    end

    def create
      @report = Report.new(report_params)
      if @report.save
          redirect_to @report, notice: 'Report was successfully created.'
      else
          render :new, status: :unprocessable_entity
      end
    end

    def show
      @report = Report.find(params[:id])
    end
    
    private
      def report_params
        params.require(:report).permit(:title, :description, :photo, :type_of_crime)
      end
end

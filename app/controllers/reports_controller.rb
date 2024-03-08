class ReportsController < ApplicationController
    before_action :authenticate_user!

    def index 
        @reports = Report.all
    end

    def new
        @report = Report.new
        @crimes = [
          # Violent Crimes
          "Assault",
          "Battery",
          "Homicide",
          "Robbery",
          "Sexual Assault",
          "Kidnapping",
        
          # Property/Theft Crimes
          "Burglary",
          "Theft",
          "Shoplifting",
          "Auto Theft",
          "Arson",
          "Vandalism",
        
          # Disorder/Disturbance Crimes
          "Public Intoxication",
          "Disorderly Conduct",
          "Disturbing the Peace",
          "Trespassing",
          "Loitering",
          "Illegal Parking",
        
          # 911-related Incidents
          "Emergency Medical Assistance",
          "Fire",
          "Domestic Violence",
          "Traffic Accident",
          "Suspicious Activity",
          "Missing Person",
        
          # Crimes related to Cars
          "Hit and Run"
        ]
        
    end

    def create
      @report = Report.new(report_params)
      if @report.save
          redirect_to reports_path, notice: 'Report was successfully created.'
      else
          render :new, status: :unprocessable_entity
      end
    end

    def show
      @report = Report.find(params[:id])
    end

    def map_data
      @reports = Report.all
      render json: @reports.to_json(only: [:title, :type_of_crime, :latitude, :longitude])
    end
    
    private
      def report_params
        params.require(:report).permit(:title, :description, :photo, :type_of_crime, :latitude, :longitude)
      end
end

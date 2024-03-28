class ReportsController < ApplicationController
  def index 
      @reports = Report.order(created_at: :desc)
  end

  def new
      @report = Report.new(status: 'pending')
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
        UserMailer.crime_reports_email(Report.all).deliver_now
        redirect_to reports_path, notice: 'Report was successfully created.'
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
    @report = Report.find(params[:id])
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


  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to reports_path, notice: 'Report was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def crime_counts_by_type
    # Query the database to get counts of each type of crime
    crime_counts = Report.group(:type_of_crime).count

    formatted_data = crime_counts.map { |type, count| { year: type, count: count } }
  
    # Convert the hash to JSON
    render json: formatted_data
  end

  def crime_counts_by_date
    crime_counts = Report.group("DATE(created_at)").count
    formatted_data = crime_counts.map { |date, count| { date: date, count: count } }
    render json: formatted_data
  end

  def show
    @report = Report.find(params[:id])
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_back fallback_location: reports_path, notice: 'Report was successfully deleted.'
  end

  def email_report
    @report = Report.find(params[:id])
    UserMailer.send_report_email(@report).deliver_now
    redirect_back fallback_location: reports_path, notice: 'Report was successfully emailed.'
  end

  def map_data
    @reports = Report.all
    render json: @reports.to_json(only: [:title, :type_of_crime, :latitude, :longitude], methods: [:photo_url])
  end
  
  private
    def report_params
      params.require(:report).permit(:title, :description, :photo, :type_of_crime, :latitude, :longitude, :phone_number, :status)
    end
end
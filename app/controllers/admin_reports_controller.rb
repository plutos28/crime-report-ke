class AdminReportsController < ApplicationController
    require 'csv'
    require 'prawn'
  
    def generate_csv
      data = Report.all
      csv_data = CSV.generate(headers: true) do |csv|
        csv << data.column_names
        data.each do |record|
          csv << record.attributes.values
        end
      end
  
      send_data csv_data, filename: "reports.csv"
    end
  
    def generate_pdf
      pdf = Prawn::Document.new
      pdf.text "Reports", align: :center, size: 20, style: :bold
      pdf.move_down 20
  
      Report.all.each do |report|
        pdf.text "Title: #{report.title}", size: 14
        pdf.text "Description: #{report.description}", size: 12
        pdf.text "Type of Crime: #{report.type_of_crime}", size: 12
        pdf.move_down 10
      end
  
      send_data pdf.render, filename: "reports.pdf", type: "application/pdf"
    end
  end
  
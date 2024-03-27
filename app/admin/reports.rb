ActiveAdmin.register Report do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description, :photo, :type_of_crime
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :photo, :type_of_crime]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  actions :index, :edit, :update, :create, :destroy

  permit_params :title, :description, :photo, :type_of_crime
  form do |f|
    f.inputs 'Report Details' do
      f.input :title
      f.input :description
      f.input :type_of_crime
      f.input :photo, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      # Display other attributes
      row :photo do |report|
        if report.photo.attached?
          image_tag rails_blob_url(report.photo)
        else
          'No photo attached'
        end
      end
    end
  end

  action_item :generate_csv, only: :index do
    link_to 'Generate Report', generate_csv_admin_reports_path(format: :csv)
  end

  collection_action :generate_csv, method: :get do
    require 'csv'

    data = Report.all
    csv_data = CSV.generate(headers: true) do |csv|
      csv << data.column_names
      data.each do |record|
        csv << record.attributes.values
      end
    end

    send_data csv_data, filename: "reports.csv"
  end

  action_item :generate_pdf, only: :index do
    link_to 'Generate PDF Report', generate_pdf_admin_reports_path(format: :pdf)
  end

  collection_action :generate_pdf, method: :get do
    require 'prawn'

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

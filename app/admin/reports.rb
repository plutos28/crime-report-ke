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
end

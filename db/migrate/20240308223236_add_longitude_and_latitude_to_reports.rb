class AddLongitudeAndLatitudeToReports < ActiveRecord::Migration[7.1]
  def change
    add_column :reports, :longitude, :float
    add_column :reports, :latitude, :float
  end
end

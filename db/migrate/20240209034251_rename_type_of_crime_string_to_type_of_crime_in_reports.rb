class RenameTypeOfCrimeStringToTypeOfCrimeInReports < ActiveRecord::Migration[7.1]
  def change
    rename_column :reports, :type_of_crime_string, :type_of_crime
  end
end

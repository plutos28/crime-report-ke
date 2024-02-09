class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.string :type_of_crime_string

      t.timestamps
    end
  end
end

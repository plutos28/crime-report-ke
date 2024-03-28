class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.string :type_of_crime
      t.float :longitude
      t.float :latitude
      t.string :phone_number
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

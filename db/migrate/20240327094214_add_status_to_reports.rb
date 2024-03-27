class AddStatusToReports < ActiveRecord::Migration[7.1]
  def change
    add_column :reports, :status, :string
  end
end

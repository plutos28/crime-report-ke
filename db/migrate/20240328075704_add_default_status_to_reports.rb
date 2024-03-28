class AddDefaultStatusToReports < ActiveRecord::Migration[7.1]
  def change
    change_column_default :reports, :status, from: nil, to: "pending"
  end
end

class RemoveUserIdFromReports < ActiveRecord::Migration[7.1]
  def change
    remove_column :reports, :user_id, :integer
  end
end

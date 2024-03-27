class AddPhoneNumberToReports < ActiveRecord::Migration[7.1]
  def change
    add_column :reports, :phone_number, :string
  end
end

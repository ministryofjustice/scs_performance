class AddTypeToReports < ActiveRecord::Migration
  def change
    add_column :reports, :type, :string
  end
end

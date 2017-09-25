class RenameTypeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :contacts, :type, :req_type
  end
end

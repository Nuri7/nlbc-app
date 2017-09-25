class AddIndexToTypeContacts < ActiveRecord::Migration[5.0]
  def change
    add_index :contacts, :type
  end
end

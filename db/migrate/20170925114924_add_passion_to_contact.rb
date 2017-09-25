class AddPassionToContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :passion, :string
  end
end

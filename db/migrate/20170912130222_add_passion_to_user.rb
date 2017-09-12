class AddPassionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :passion, :string
  end
end

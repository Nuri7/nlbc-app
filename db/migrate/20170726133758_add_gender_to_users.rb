class AddGenderToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :male, :boolean

    add_column :teams, :male, :boolean
    add_column :teams, :female, :boolean
  end
end

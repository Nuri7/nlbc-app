class AddIndexToLocationCity < ActiveRecord::Migration[5.0]
  def change
    add_index :teachers, :location_city
  end
end

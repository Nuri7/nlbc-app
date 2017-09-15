class AddLocationCityToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :location_city, :string
  end
end

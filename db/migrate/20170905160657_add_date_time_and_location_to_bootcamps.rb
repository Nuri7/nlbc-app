class AddDateTimeAndLocationToBootcamps < ActiveRecord::Migration[5.0]
  def change
    add_column :bootcamps, :date, :date
    add_column :bootcamps, :time, :time
    add_column :bootcamps, :location, :string
  end
end

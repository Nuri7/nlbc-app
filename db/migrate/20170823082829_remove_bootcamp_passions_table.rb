class RemoveBootcampPassionsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :bootcamp_passions
  end
end

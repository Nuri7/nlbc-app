class CreateBootcampPassions < ActiveRecord::Migration[5.0]
  def change
    create_table :bootcamp_passions do |t|
      t.references :bootcamp, foreign_key: true
      t.references :passion, foreign_key: true
    end
  end
end

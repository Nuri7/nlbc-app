class CreatePassions < ActiveRecord::Migration[5.0]
  def change
    create_table :passions do |t|
      t.string :title

      t.timestamps
    end
  end
end

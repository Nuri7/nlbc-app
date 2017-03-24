class CreateUserPassions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_passions do |t|
      t.references :user, foreign_key: true
      t.references :passion, foreign_key: true
    end
  end
end

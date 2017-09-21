class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :work_phone
      t.string :organization_name
      t.string :employees_number
      t.text :comments

      t.timestamps
    end
  end
end

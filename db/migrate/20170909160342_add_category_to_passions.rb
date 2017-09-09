class AddCategoryToPassions < ActiveRecord::Migration[5.0]
  def change
    add_reference :passions, :category, foreign_key: true
  end
end

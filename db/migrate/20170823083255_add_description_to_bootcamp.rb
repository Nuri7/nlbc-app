class AddDescriptionToBootcamp < ActiveRecord::Migration[5.0]
  def change
    add_column :bootcamps, :description, :text
  end
end

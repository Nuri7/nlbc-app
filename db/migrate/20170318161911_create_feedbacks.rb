class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.text :text
      t.references :bootcamp, foreign_key: true

      t.timestamps
    end
  end
end

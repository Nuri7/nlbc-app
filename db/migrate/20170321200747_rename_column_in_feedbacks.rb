class RenameColumnInFeedbacks < ActiveRecord::Migration[5.0]
  def change
    rename_column :feedbacks, :text, :plans
  end
end

class AddColumnsToFeedbacks < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :name, :string
    add_column :feedbacks, :company_and_position, :string
    add_column :feedbacks, :rate_bootcamp, :integer
    add_column :feedbacks, :most_value, :string
    add_column :feedbacks, :least, :string
    add_column :feedbacks, :describe_bootcamp, :text
    add_column :feedbacks, :rate_trainer, :integer
    add_column :feedbacks, :tips_to_trainer, :text
    add_column :feedbacks, :suggestion, :text
    add_column :feedbacks, :other_bootcamps, :string
    add_column :feedbacks, :contact, :string
  end
end

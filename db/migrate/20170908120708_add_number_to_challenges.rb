class AddNumberToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :number, :integer
  end
end

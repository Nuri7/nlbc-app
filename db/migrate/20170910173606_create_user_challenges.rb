class CreateUserChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :user_challenges do |t|
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true
      t.integer :times

      t.timestamps
    end
  end
end

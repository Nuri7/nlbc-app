class CreateBootcampChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :bootcamp_challenges do |t|
      t.references :bootcamp, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end

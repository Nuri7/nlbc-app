class AddPassionToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_reference :challenges, :passion, foreign_key: true
  end
end

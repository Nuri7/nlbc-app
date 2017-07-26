class AddMixGendersToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :mix_genders, :boolean
  end
end

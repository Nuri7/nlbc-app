class AddPerTeamNumberToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :per_team, :integer
  end
end

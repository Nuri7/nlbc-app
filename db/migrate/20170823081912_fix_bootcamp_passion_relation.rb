class FixBootcampPassionRelation < ActiveRecord::Migration[5.0]
  def change
    add_reference :bootcamps, :passion, foreign_key: true
  end
end

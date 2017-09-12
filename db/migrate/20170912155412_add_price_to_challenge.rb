class AddPriceToChallenge < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :price, :integer
  end
end

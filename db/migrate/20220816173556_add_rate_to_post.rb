class AddRateToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :rate, :integer
  end
end

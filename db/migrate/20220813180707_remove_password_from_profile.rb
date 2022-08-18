class RemovePasswordFromProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :password, :string
  end
end

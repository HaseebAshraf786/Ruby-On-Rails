class AddPstatusToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :pstatus, :integer
  end
end

class RemovePasswordDigestFromProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :password_digest, :string
  end
end

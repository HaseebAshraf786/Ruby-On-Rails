class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :role
      t.integer :hired_freelacers
      t.string :name
      t.integer :phone
      t.string :email
      t.string :password
      t.string :country
      t.integer :pending_projects
      t.integer :completed_projects

      t.timestamps
    end
  end
end

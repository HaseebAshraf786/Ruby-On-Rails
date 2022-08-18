class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :perhourrate
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end

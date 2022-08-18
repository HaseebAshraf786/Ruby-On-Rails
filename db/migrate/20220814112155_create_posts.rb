class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :requirement
      t.integer :budget
      t.string :description
      t.integer :seller_id
      t.integer :buyer_id
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end

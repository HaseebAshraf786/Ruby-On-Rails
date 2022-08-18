class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.integer :profile_id
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class AddAstatusToApplicant < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :astatus, :integer
  end
end

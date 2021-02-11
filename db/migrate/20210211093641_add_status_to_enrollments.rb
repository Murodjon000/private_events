class AddStatusToEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_column :enrollments, :status, :integer
  end
end

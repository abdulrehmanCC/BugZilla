class AddAssignedBugsToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :assigned_bugs, index: true
    add_foreign_key :users, :bugs, column: :assigned_bugs_id
  end
end

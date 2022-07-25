class AddCreatedBugsToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :created_bugs, index: true
    add_foreign_key :users, :bugs, column: :created_bugs_id
  end
end

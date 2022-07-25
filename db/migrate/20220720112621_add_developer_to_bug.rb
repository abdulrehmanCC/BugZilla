class AddDeveloperToBug < ActiveRecord::Migration[6.1]
  def change
    add_reference :bugs, :developer, index: true
    add_foreign_key :bugs, :users, column: :developer_id
  end
end

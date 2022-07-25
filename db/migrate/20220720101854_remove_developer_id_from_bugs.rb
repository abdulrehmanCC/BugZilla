class RemoveDeveloperIdFromBugs < ActiveRecord::Migration[6.1]
  def change
    remove_column :bugs, :developer_id
  end
end

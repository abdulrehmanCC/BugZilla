class CreateBugs < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description
      t.integer :developer_id
      t.datetime :deadline
      t.text :screenshot
      t.integer :bug_type
      t.integer :status

      t.timestamps
    end
  end
end

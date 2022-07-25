class AddImageToBugs < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :image, :string
  end
end

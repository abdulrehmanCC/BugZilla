class RemoveAvatarsFromBugs < ActiveRecord::Migration[6.0]
  def change
    remove_column :bugs, :avatars, :json

  end
end

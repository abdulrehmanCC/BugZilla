class AddAvatarsToBugs < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :avatars, :json
  end
end

class AddRequiredExtensionsToPsql < ActiveRecord::Migration[5.2]
  def change
    enable_extension "cube"
    enable_extension "earthdistance"
    enable_extension "btree_gist"
  end
end

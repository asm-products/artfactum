class RenameNameToTitleForGalleries < ActiveRecord::Migration
  def change
    rename_column :galleries, :name, :title
  end
end

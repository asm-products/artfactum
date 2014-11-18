class AddCategoryIdToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :category_id, :integer, index: true
  end
end

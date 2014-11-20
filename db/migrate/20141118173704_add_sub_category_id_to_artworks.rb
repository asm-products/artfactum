class AddSubCategoryIdToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :sub_category_id, :integer, index: true
  end
end

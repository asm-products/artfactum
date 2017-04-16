class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.string :slug
      t.belongs_to :category, index: true
      t.integer :artworks_count, default: 0

      t.timestamps
    end
    add_index :sub_categories, :slug, unique: true
  end
end

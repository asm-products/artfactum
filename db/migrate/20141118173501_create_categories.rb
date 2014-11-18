class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.integer :artworks_count, default: 0

      t.timestamps
    end
    add_index :categories, :slug, unique: true
  end
end

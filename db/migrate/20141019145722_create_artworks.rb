class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.belongs_to :user, index: true
      t.belongs_to :gallery, index: true
      t.string :title
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end

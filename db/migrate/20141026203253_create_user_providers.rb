class CreateUserProviders < ActiveRecord::Migration
  def change
    create_table :user_providers do |t|
      t.string :name
      t.timestamps
    end
    add_index :user_providers, :name, unique: true
  end
end

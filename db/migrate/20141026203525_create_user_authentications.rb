class CreateUserAuthentications < ActiveRecord::Migration
  def change
    create_table :user_authentications do |t|
      t.integer 'user_id'
      t.integer 'provider_id'
      t.string 'uid'
      t.string 'token'
      t.datetime 'token_expires_at'
      t.text 'params'
      t.timestamps
    end
    add_index :user_authentications, :provider_id
    add_index :user_authentications, :user_id
  end
end

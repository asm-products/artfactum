class NamespaceAttachments < ActiveRecord::Migration
  def change
    rename_table :attachments, :artwork_attachments
    rename_column :artwork_attachments, :artworks_id, :artwork_id
    remove_column :artwork_attachments, :user_id
  end
end

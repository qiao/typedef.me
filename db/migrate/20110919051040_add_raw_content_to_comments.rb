class AddRawContentToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :raw_content, :text
  end

  def self.down
    remove_column :comments, :raw_content
  end
end

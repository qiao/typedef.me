class AddRawContentToCommentables < ActiveRecord::Migration
  def self.up
    add_column :commentables, :raw_content, :text
  end

  def self.down
    remove_column :commentables, :raw_content
  end
end

class AddTypeToCommentables < ActiveRecord::Migration
  def self.up
    add_column :commentables, :type, :string
  end

  def self.down
    remove_column :commentables, :type
  end
end

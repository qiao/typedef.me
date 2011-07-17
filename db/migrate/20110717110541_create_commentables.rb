class CreateCommentables < ActiveRecord::Migration
  def self.up
    create_table :commentables do |t|
      t.string :title
      t.text :content
      t.boolean :published
      t.string :slug

      t.timestamps
    end
  end

  def self.down
    drop_table :commentables
  end
end

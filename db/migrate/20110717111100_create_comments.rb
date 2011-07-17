class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :author_name
      t.string :author_email
      t.string :author_url
      t.string :user_agent
      t.text :content

      t.references :commentable, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end

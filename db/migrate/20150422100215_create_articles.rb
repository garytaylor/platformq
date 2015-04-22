class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :owner_id
      t.string :url_slug
      t.string :title
      t.datetime :posted_on
      t.text :body
      t.string :body_content_type

      t.timestamps null: false
    end
    add_index :articles, :url_slug, unique: false #The url slug does not have to be unique across the entire table.
    add_index :articles, :owner_id, unique: false
  end
end

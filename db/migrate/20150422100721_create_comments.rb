class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.integer :owner_id
      t.text :body
      t.datetime :posted_on

      t.timestamps null: false
    end
  end
end

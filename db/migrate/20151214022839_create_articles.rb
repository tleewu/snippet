class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id, null: false
      t.integer :friendship_id
      t.text :url, null: false
      t.timestamps null: false
    end
  end
end

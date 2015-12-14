class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :friend_one_id, null: false
      t.integer :friend_two_id, null: false
      t.timestamps null: false
    end
  end
end

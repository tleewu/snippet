class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.integer :article_id, null: false
      t.string :highlight, null: false
      t.string :start_node, null: false
      t.integer :start_offset, null: false
      t.timestamps null: false
    end
  end
end

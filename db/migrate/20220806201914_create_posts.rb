class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :author_id
      t.integer :group_id

      t.timestamps
    end
  end
end

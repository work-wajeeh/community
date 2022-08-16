class RemoveContentFromComment < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :content
  end
end

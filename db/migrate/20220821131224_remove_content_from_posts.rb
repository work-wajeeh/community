class RemoveContentFromPosts < ActiveRecord::Migration[7.0]
  def change
    def change
      remove_column :posts, :content
    end
  end
end

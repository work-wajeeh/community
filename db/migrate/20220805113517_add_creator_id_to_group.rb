class AddCreatorIdToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :creator_id, :integer
  end
end

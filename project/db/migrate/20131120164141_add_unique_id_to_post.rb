class AddUniqueIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :unique_id, :string
  end
end

class AddDeletedAtToWagons < ActiveRecord::Migration
  def change
    add_column :wagons, :deleted_at, :datetime
    add_index :wagons, :deleted_at
  end
end

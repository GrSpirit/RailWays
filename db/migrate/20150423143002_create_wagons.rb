class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.string :label, null: false
      t.text :description
      t.date :manufactured_at
      t.date :repaired_at

      t.timestamps null: false
    end

    add_index :wagons, :label, unique: true
  end
end

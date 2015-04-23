class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.string :label, null: false
      t.text :description
      t.date :created_at
      t.date :repared_at

      t.timestamps null: false
    end

    add_index :wagons, :label, unique: true
  end
end

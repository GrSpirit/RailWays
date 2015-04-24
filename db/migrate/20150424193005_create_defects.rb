class CreateDefects < ActiveRecord::Migration
  def change
    create_table :defects do |t|
      t.text :description, null: false
      t.references :detail, index: true, foreign_key: true
      t.references :wagon, index: true, foreign_key: true
      t.datetime :registered_at, null: false
      t.datetime :fixed_at

      t.timestamps null: false
    end
  end
end

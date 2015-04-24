class CreateDetailTypes < ActiveRecord::Migration
  def change
    create_table :detail_types do |t|
      t.string :name
      t.references :detail_class, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

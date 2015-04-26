class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :name
      t.date :manufactured_at
      t.date :repaired_at
      t.references :detail_model, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

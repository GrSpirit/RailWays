class CreateDetailModels < ActiveRecord::Migration
  def change
    create_table :detail_models do |t|
      t.string :name
      t.references :detail_type, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

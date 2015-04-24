class CreateDetailClasses < ActiveRecord::Migration
  def change
    create_table :detail_classes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.references :page, index: true, foreign_key: true
      t.integer :type
      t.string :link
      t.string :description
      t.string :name
      t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height

      t.timestamps null: false
    end
  end
end

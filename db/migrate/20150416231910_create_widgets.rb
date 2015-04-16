class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.references :page, index: true, foreign_key: true
      t.integer :type
      t.string :link
      t.string :description
      t.string :name

      t.timestamps null: false
    end
  end
end

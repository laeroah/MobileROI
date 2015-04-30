class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name
      t.integer :width
      t.integer :height

      t.timestamps null: false
    end
  end
end

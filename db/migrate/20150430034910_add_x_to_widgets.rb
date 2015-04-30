class AddXToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :x, :integer
  end
end

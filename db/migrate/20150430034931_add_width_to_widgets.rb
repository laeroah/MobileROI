class AddWidthToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :width, :integer
  end
end

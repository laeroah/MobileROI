class AddHeightToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :height, :integer
  end
end

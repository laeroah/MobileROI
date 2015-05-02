class AddWidgetTypeToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :widget_type, :integer
  end
end

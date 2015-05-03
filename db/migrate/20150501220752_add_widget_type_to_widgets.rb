class AddWidgetTypeToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :widget_type, :string
  end
end

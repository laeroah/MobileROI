class AddYToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :y, :integer
  end
end

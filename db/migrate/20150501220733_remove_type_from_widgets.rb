class RemoveTypeFromWidgets < ActiveRecord::Migration
  def change
    remove_column :widgets, :type, :integer
  end
end

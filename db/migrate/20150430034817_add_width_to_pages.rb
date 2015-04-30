class AddWidthToPages < ActiveRecord::Migration
  def change
    add_column :pages, :width, :integer
  end
end

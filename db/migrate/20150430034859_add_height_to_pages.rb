class AddHeightToPages < ActiveRecord::Migration
  def change
    add_column :pages, :height, :integer
  end
end

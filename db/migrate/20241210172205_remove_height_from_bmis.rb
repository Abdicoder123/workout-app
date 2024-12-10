class RemoveHeightFromBmis < ActiveRecord::Migration[7.2]
  def change
    remove_column :bmis, :height, :float
  end
end

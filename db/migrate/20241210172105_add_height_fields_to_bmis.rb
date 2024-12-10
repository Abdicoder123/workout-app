class AddHeightFieldsToBmis < ActiveRecord::Migration[7.2]
  def change
    add_column :bmis, :height_ft, :integer
    add_column :bmis, :height_in, :integer
  end
end

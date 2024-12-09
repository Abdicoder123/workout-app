class CreateBmis < ActiveRecord::Migration[7.2]
  def change
    create_table :bmis do |t|
      t.float :height, null: false
      t.float :weight, null: false
      t.float :number, null: false
      t.string :category, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
class AddImageColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image, :file
  end
end

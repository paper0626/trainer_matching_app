class ChangeTrainers < ActiveRecord::Migration[5.1]
  def change
    add_column :trainers, :user_id, :integer
    remove_columns :trainers, :name, :email, :password_digest
  end
end

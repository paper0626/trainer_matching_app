class CreateTrainers < ActiveRecord::Migration[5.1]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :message

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :role
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end

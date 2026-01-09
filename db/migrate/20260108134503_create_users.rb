class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps

      t.index :nome, unique: true
      t.index :email, unique: true
    end
  end
end

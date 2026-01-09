class CreateUserPrivileges < ActiveRecord::Migration[8.1]
  def change
    create_table :user_privileges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :privilege, null: false, foreign_key: true

      t.timestamps
    end
  end
end

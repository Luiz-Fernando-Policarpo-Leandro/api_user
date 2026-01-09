class CreatePrivileges < ActiveRecord::Migration[8.1]
  def change
    create_table :privileges do |t|
      t.string :action, null: false
      t.string :description

      t.timestamps
    end
  end
end

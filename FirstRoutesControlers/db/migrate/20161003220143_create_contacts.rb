class CreateContacts < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, default: 'Bozo'

    remove_column :users, :name

    add_index :users, :username, unique: true

    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :contacts, :user_id
  end
end

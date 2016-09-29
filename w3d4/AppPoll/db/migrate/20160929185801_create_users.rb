class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user, null: false
      t.timestamps null: false
    end
    add_index :users, :user, unique: true
  end
end

class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.integer :poll_author, null: false
      t.timestamps null: false
    end
  end
end

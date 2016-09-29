class CreateTagTopics < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.string :tag_name, null: false
    end
    add_index :tag_topics, :tag_name, :unique => true
  end
end

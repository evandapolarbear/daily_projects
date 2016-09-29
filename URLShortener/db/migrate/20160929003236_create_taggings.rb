class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :url_id, :null => false
      t.integer :tag_id, :null => false
    end
  end
end

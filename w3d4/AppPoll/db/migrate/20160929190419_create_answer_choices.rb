class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.text :answer, null:false
      t.integer :question_id, null:false
      t.timestamps null: false
    end
  end
end

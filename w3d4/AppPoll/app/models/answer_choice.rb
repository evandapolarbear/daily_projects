class AnswerChoice < ActiveRecord::Base
  belongs_to :question,
    class_name: :Question,
    foreign_key: :question_id,
    primary_key: :id

    has_many :responses,
      class_name: :Response,
      primary_key: :id ,
      foreign_key: :answer_id

end

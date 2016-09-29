class Question < ActiveRecord::Base
  belongs_to :poll,
    class_name: :Poll,
    foreign_key: :poll_id,
    primary_key: :id

  has_many :answers,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answers,
    source: :responses

  def results
    hash = Hash.new(0)
    answers = self.answers#.responses
    q_responses = self.responses

    answers.each do |a|
      q_responses.each do |q|
        hash[a.answer] += 1 if a.id == q.answer_id
      end
    end

    hash
  end

end

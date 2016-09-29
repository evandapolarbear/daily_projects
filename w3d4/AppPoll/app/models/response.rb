class Response < ActiveRecord::Base
   validate :sibling_response, :author_response

  belongs_to :answer,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :answer_id

  belongs_to :user,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_one :question,
    through: :answer,
    source: :question

  def sibling_check
    self_id = self.user_id
    count = self.question.responses.map{|x| x.user_id}.count{|x| x == self_id}

    count > 1 ? false : true
  end

  def sibling_response
    errors.add(:base, "Can only give one response") if sibling_check
  end

  def author_check
    query = self.question.poll.poll_author
    self.question.responses.map{|x| x.user_id}.include?(query) ? true : false
  end

  def author_response
    errors.add(:base, "Author Can only give one response") if author_check
  end

end

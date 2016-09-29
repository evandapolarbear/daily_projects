class Poll < ActiveRecord::Base
  belongs_to :author,
    class_name: :user,
    primary_key: :id,
    foreign_key: :poll_author

  has_many :questions,
    class_name: :Question,
    primary_key: :id,
    foreign_key: :poll_id

end

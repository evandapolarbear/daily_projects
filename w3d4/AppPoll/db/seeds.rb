# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(user: "Loren")
User.create(user: "Evan")

Poll.create(title: 'election', poll_author: 1)
Poll.create(title: 'sentiment', poll_author: 2)
Poll.create(title: 'cats', poll_author: 1)

Question.create(body: "hello", poll_id: 1)
Question.create(body: "its", poll_id: 1)
Question.create(body: "me", poll_id: 2)
Question.create(body: "adele", poll_id: 2)
Question.create(body: "from", poll_id: 3)
Question.create(body: "britian", poll_id: 3)

AnswerChoice.create(answer: "Yes", question_id: 1)
AnswerChoice.create(answer: "No", question_id: 1)

AnswerChoice.create(answer: "Yay", question_id: 2)
AnswerChoice.create(answer: "Nay", question_id: 2)

AnswerChoice.create(answer: "T", question_id: 3)
AnswerChoice.create(answer: "F", question_id: 3)

AnswerChoice.create(answer: "Yah", question_id: 4)
AnswerChoice.create(answer: "Nah", question_id: 4)

AnswerChoice.create(answer: "Brah", question_id: 5)
AnswerChoice.create(answer: "Dah", question_id: 5)

AnswerChoice.create(answer: "Yo", question_id: 6)
AnswerChoice.create(answer: "Ho", question_id: 6)

Response.create(user_id: 1, answer_id: 1)
# Response.create(user_id: 2, answer_id: 1)
Response.create(user_id: 1, answer_id: 4)
Response.create(user_id: 1, answer_id: 5)
Response.create(user_id: 2, answer_id: 7)
Response.create(user_id: 2, answer_id: 9)
Response.create(user_id: 2, answer_id: 11)
# Response.create(user_id: 1, answer_id: 2)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create!([{ user_name: 'Bob' }, { user_name: 'Rumo'},
  { user_name: 'Obama'}])

polls = Poll.create!([{ title: 'Politics', author_id: users.last.id }])

questions = Question.create!([
  { question_text: 'Would you vote for my third term?', poll_id: polls.first.id },
  { question_text: 'Why is app academy so obsessed with cats?', poll_id: polls.first.id },
  { question_text: 'Will building minesweeper get me a 6 figure job?', poll_id: polls.first.id }])

answer_choices = AnswerChoice.create!(
[{answer_text: 'Yes', question_id: questions.first.id},
  {answer_text: 'No', question_id: questions.first.id},
  {answer_text: 'are you president right now?', question_id: questions.first.id},
  {answer_text: 'Because they are great', question_id: questions[1].id},
  {answer_text: 'No idea, dogs are better', question_id: questions[1].id},
  {answer_text: 'No', question_id: questions[2].id},
  {answer_text: 'Be more amitious, minesweeper is worth millions', question_id: questions[2].id},
  {answer_text: 'Learn rails first', question_id: questions[2].id}])

responses = Response.create!([
  {answer_choice_id: 1, respondent_id: 1},
  {answer_choice_id: 1, respondent_id: 2},
  {answer_choice_id: 3, respondent_id: 2},
  {answer_choice_id: 2, respondent_id: 1},
  {answer_choice_id: 3, respondent_id: 3}
])

# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer
#  respondent_id    :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Response < ActiveRecord::Base
  validates :respondent, presence: true
  validate :respondent_has_not_already_answered_question

  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: "User",
    foreign_key: :respondent_id,
    primary_key: :id
  )

  has_one :question, through: :answer_choice, source: :question

  def sibling_responses
    question.responses.where("? IS NULL OR responses.id != ?", self.id, self.id)
  end

  private

  def respondent_has_not_already_answered_question
    # !sibling_responses.includes(:association_name)
    if sibling_responses.where("? IN responses.respondent_id", self.respondent_id)
      self.errors[:answer_error] << "Already answered question"
    end
  end

end

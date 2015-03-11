module UserAssessmentsHelper
  def mark_correct(answer)
    answer.correct? ? 'correct' : ''
  end

  def is_checked?(question, answer)
    @user_assessment.user_answers[question.id.to_s] == answer.id.to_s
  end

  def mark_answer(question, answer)
    if is_checked?(question, answer)
      answer.correct? ? 'text-success' : 'text-primary'
    else
      answer.correct? ? 'text-success' : ''
    end
  end
end

module UserAssessmentsHelper
  def mark_correct(answer)
    answer.correct? ? 'correct' : ''
  end

  def mark_answer(question, answer)
    is_checked = @user_assessment.user_answers[question] == answer.id.to_s

    if is_checked
      answer.correct? ? 'text-success' : 'text-primary'
    else
      answer.correct? ? 'text-success' : ''
    end
  end
end

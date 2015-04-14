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

  def random_box_type
    %w(green blue pink red orange2 blue2).sample
  end

  def random_sm_box_type
    %w(green blue grey).sample
  end

  def format_string_by_count(name, count = 1)
    name.pluralize(count)
  end

  def build_box_content(box = {})
    content_tag :p do
     ('In '+ content_tag(:b, box[:total].to_s, class: 'content-total' ) + ' available').html_safe
    end
  end
end

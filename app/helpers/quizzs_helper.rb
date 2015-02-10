module QuizzsHelper
  def build_form_index(index, label = nil)
    "#{label} ##{index + 1}"
  end

  def render_category_level?(quizz, section)
    quizz.options['category_level'] == section
  end
end

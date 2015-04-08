json.user_assesments @user_assessments do |user_assessment|
  json.id    user_assessment.id
  json.title user_assessment.quizz_title
  json.user_id user_assessment.user ? user_assessment.user.id : nil
end
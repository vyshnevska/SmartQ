json.user_assesment do
  json.id    @user_assesment.id
  json.title @user_assesment.quizz_title

  json.artist_id @user_assesment.user ? @user_assesment.user.id : nil
end
class CreateUserAssessments < ActiveRecord::Migration
  def change
    create_table :user_assessments do |t|
      t.integer :user_id
      t.integer :quizz_id
      t.integer :grade
      t.integer :current_question_id
      t.integer :state

      t.timestamps
    end
  end
end

class AddIndexes < ActiveRecord::Migration
  def change
    add_index :quizzs, :category_id
    add_index :questions, :category_id

    add_index :user_assessments, :user_id
    add_index :user_assessments, :quizz_id
  end
end

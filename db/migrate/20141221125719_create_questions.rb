class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, limit: 200
      t.integer :quizz_id
      t.integer :category_id
      t.timestamps
    end

    add_index :questions, :quizz_id
    add_index :questions, :category_id
  end
end

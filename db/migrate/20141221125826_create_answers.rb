class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title, limit: 200
      t.integer :question_id
      t.boolean :correct
      t.string :explanation, limit: 200

      t.timestamps
    end

    add_index :answers, :question_id
  end
end

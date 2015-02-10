class CreateQuizzs < ActiveRecord::Migration
  def change
    create_table :quizzs do |t|
      t.string :title, limit: 50
      t.integer :category_id
      t.string :state
      t.text :options
      t.timestamps
    end

    add_index :quizzs, :category_id
  end
end

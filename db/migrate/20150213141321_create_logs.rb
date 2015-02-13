class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.string :table_name
      t.string :action
      t.integer :deleted_id
      t.text :content
      t.datetime :deleted_at
      t.integer :deleted_by
    end
  end

  def self.down
    drop_table :logs
  end
end

class AddIpLocationColumnsIntoUsers < ActiveRecord::Migration
  def change
    add_column :users, :ip, :string
    add_column :users, :location, :text
  end
end

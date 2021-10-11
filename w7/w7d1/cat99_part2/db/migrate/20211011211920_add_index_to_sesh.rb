class AddIndexToSesh < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :username
    add_index :users, :session_token, unique:true
  end
end

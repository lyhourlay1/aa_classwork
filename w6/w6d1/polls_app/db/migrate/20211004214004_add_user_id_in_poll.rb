class AddUserIdInPoll < ActiveRecord::Migration[5.2]
  def change
    add_column(:polls, :user_id, :string, null:false)
  end
end

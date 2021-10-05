class AddPollIdInQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column(:questions, :poll_id, :integer, null:false)
    remove_column(:polls, :user_id)
    add_column(:polls, :user_id, :integer, null:false)
  end
end

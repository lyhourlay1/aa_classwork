class CreatePoll < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string 'title', null: false
    end
    add_index(:polls, :title)
  end
end

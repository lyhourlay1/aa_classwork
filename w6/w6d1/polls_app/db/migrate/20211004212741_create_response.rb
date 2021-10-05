class CreateResponse < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string 'answer', null:false
    end
    add_index(:responses, :answer)
  end
end

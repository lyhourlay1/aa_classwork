class AddIndexUnique < ActiveRecord::Migration[5.2]
  def change
    remove_column(:users, :email)
    add_column(:users, :email, :string, null:false)
    add_index(:users, :email, unique: true)
  end
end

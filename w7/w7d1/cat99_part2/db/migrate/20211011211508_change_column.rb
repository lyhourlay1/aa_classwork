class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :pw_digeest, :pw_digest
  end
end

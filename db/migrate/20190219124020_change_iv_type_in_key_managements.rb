class ChangeIvTypeInKeyManagements < ActiveRecord::Migration[5.1]
  def change
    change_column :key_managements, :iv, :binary
  end
end

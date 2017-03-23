class AddColumsToCharacter < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :nickname, :string
  end
end

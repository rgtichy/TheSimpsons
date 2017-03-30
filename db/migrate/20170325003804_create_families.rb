class CreateFamilies < ActiveRecord::Migration[5.0]
  def change
    create_table :families do |t|
      t.references :character
      t.integer :family_member, class_name: "Character"

      t.timestamps
    end
  end
end

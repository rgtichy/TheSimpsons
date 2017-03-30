class ChangeColumnNameInFamilies < ActiveRecord::Migration[5.0]
  def change
    rename_column :families, :family_member, :family_member_id
  end
end

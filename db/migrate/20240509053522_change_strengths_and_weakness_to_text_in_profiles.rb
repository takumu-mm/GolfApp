class ChangeStrengthsAndWeaknessToTextInProfiles < ActiveRecord::Migration[7.1]
  def change
    change_column :profiles, :strengths, :text
    change_column :profiles, :weakness, :text
  end
end

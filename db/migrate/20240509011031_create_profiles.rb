class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :score
      t.string :ball_type
      t.string :strengths
      t.string :weakness
      t.string :sports_experience
      t.string :avatar

      t.timestamps
    end
  end
end

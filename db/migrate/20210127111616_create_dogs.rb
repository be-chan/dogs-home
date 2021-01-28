class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :title, null: false
      t.integer :dog_gender, null: false
      t.integer :dog_age_id, null: false
      t.integer :vaccine, null: false
      t.integer :surgery, null: false
      t.integer :prefecture_id, null: false
      t.string :feature, null: false
      t.string :reason, null: false
      t.string :remarks
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

class CreateInquiryForms < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiry_forms do |t|
      t.integer :experience, default: 0
      t.string  :care_take, null: false
      t.string :hope, null: false
      t.references :inquiry_record, foreign_key: true
      t.references :dog, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

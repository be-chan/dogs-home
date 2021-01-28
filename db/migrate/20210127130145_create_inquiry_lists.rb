class CreateInquiryLists < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiry_lists do |t|
      t.references :user, foreign_key: true
      t.references :dog, foreign_key: true
      t.references :inquiry_form, foreign_key: true
      t.timestamps
    end
  end
end

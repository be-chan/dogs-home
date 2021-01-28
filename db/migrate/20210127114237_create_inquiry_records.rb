class CreateInquiryRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiry_records do |t|
      t.references :user, foreign_key: true
      t.references :dog, foreign_key: true
      t.timestamps
    end
  end
end

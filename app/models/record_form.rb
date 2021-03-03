class RecordForm
  include ActiveModel::Model
    
  attr_accessor :experience, :care_take, :hope, :user_id, :dog_id

  

  with_options presence: true do
    validates :dog_id, :user_id
    validates :experience, presence: { message:'を選択してください'}
    validates :care_take, :hope, length: { maximum: 250 }
  end

  def save
    inquiry_record = InquiryRecord.create(user_id: user_id,dog_id: dog_id)
    InquiryForm.create(experience: experience, care_take: care_take, hope: hope,inquiry_record_id: inquiry_record.id, dog_id: inquiry_record.dog_id,user_id: inquiry_record.user_id)
  end
end
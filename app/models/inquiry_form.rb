class InquiryForm < ApplicationRecord
  belongs_to :inquiry_record
  belongs_to :dog
  has_one :inquiry_list

  enum experience: { 有り:1,無し:2 }
end

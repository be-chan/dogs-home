class InquiryForm < ApplicationRecord
  belongs_to :inquiry_record
  has_one :inquiry_list

  enum experience: { 有り:1,無し:2 }
end

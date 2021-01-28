class InquiryForm < ApplicationRecord
  belongs_to :inquiry_record
  belongs_to :dog
  has_one :inquiry_list
end

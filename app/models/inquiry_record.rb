class InquiryRecord < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  has_one :inquiry_form
end

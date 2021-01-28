class InquiryList < ApplicationRecord
  belongs_to :user
  belongs_to :inquiry_form
  belongs_to :dog
end

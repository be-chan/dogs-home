class Dog < ApplicationRecord
  belongs_to :user 
  has_one :inquiry_records
  has_many :inquiry_forms
  has_many :inquiry_lists
  has_one_attached :image
end

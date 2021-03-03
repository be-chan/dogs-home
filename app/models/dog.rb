class Dog < ApplicationRecord
  belongs_to :user 
  has_many :inquiry_records
  has_many :inquiry_forms
  has_one_attached :image

  enum dog_gender: { オス:1, メス:2 }
  enum vaccine:    { 接種済:1, 未接種:2 }
  enum surgery:    { 手術済:1, 未手術:2 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :dog_age
  belongs_to :prefecture
  
  with_options presence: true do
    validates :image, :dog_gender, :vaccine, :surgery, presence: { message: 'を選択してください'} 
    validates :title, length: { maximum: 40 }
    validates :feature, :reason, length: { maximum: 1000 }
  end

  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :prefecture_id, :dog_age_id
  end

  validates :remarks, length: { maximum: 1000 }
end

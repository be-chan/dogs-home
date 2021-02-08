class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :dogs
  has_many :inquiry_records
  has_many :inquiry_lists

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :job 
  belongs_to :age
  belongs_to :gender

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i , message: 'は英数字混合8文字以上で入力してください' } do
  validates :password, :password_confirmation, on: :create 
  end

  with_options presence: true do 
    validates :nickname, :city, :address
    validates :full_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角(漢字,ひらがな,カタカナ)で入力してください'}
    validates :full_name_kana, format: { with: /\A[ァ-ヶー－]/ ,message: 'は全角(カタカナで入力してください' }
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ ,message: 'はハイフンを含めてください' }
    validates :phone_number, format: { with: /\A0[0-9]+\z/, message: 'は半角数字(ハイフンなし)で入力してください'}, length: { maximum: 11, message: 'は11桁以内で入力してください' }
  end

  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :prefecture_id, :job_id, :age_id, :gender_id
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  
  
end

require 'rails_helper'

RSpec.describe RecordForm, type: :model do
  before do
    @record_form = FactoryBot.build(:record_form)
  end

  describe '応募フォームの送信' do
    context '送信ができるとき' do
      it '全ての値が入力されているときは送信される' do
        expect(@record_form).to be_valid
      end
    end

    context '送信ができないとき' do
      it 'user_idが空のときは送信できない' do
        @record_form.user_id =''
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("Userを入力してください")
      end
      it 'dog_idが空のときは送信できない' do
        @record_form.dog_id = ''
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("Dogを入力してください")
        
      end
      it 'experienceが空のときは送信できない' do
        @record_form.experience = ''
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("飼育経験を選択してください")
      end
      it 'care_takeが空のときは送信できない' do
        @record_form.care_take =''
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("留守番の平均時間とその理由を入力してください")
      end
      it 'hopeが空のときは送信できない' do
        @record_form.hope = ''
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("里親希望動機を入力してください")
      end
      
    end
  end
end

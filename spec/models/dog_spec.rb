require 'rails_helper'

RSpec.describe Dog, type: :model do
  before do
    @dog = FactoryBot.build(:dog)
  end
  describe '犬の掲載登録' do
    context '掲載登録ができるとき' do
      it '全ての値を入力した場合は掲載登録ができる' do
        expect(@dog).to be_valid
      end

      it 'remarksが空でも掲載登録ができる' do
        @dog.remarks = ''
        expect(@dog).to be_valid
      end
    end

    context '掲載登録ができないとき' do
      it 'imageが空の場合は登録ができない' do
        @dog.image = nil
        @dog.valid?
        expect(@dog.errors.full_messages).to include("画像を選択してください")
      end

      it 'titleが空の場合は登録ができない' do
        @dog.title = ''
        @dog.valid?
        expect(@dog.errors.full_messages).to include("タイトルを入力してください")
      end

      it 'titleが41文字以上の場合は登録ができない' do
        @dog.title = 'あ' * 41
        @dog.valid?
        expect(@dog.errors.full_messages).to include("タイトルは40文字以内で入力してください")
      end
      it 'dog_genderが空の場合は登録ができない' do
        @dog.dog_gender = ''
        @dog.valid?
        expect(@dog.errors.full_messages).to include("性別を選択してください")
      end
      it 'dog_age_idが選択されていない場合は登録ができない' do
        @dog.dog_age_id = 1 
        @dog.valid?
        expect(@dog.errors.full_messages).to include("推定年齢を選択してください")
      end
      it 'vaccineが空の場合は登録ができない' do
        @dog.vaccine = ''
        @dog.valid?
        expect(@dog.errors.full_messages).to include("ワクチンを選択してください")
      end
      it 'surgeryが空の場合は登録ができない' do
        @dog.surgery = ''
        @dog.valid?
        expect(@dog.errors.full_messages).to include("手術を選択してください")
      end
      it 'prefecture_idが選択されていない場合は登録ができない' do
        @dog.prefecture_id = 1
        @dog.valid?
        expect(@dog.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'featureが空の場合は登録ができない' do
        @dog.feature = ''
        @dog.valid?
        expect(@dog.errors.full_messages).to include("特徴を入力してください")
      end
      it 'featureが1001文字以上の場合は登録ができない' do
        @dog.feature = 'あ' * 1001
        @dog.valid?
        expect(@dog.errors.full_messages).to include("特徴は1000文字以内で入力してください")
      end
      it 'reasonが空の場合は登録ができない' do
        @dog.reason = ''
        @dog.valid?
        expect(@dog.errors.full_messages).to include("募集理由を入力してください")
      end
      it 'reasonが1001文字以上場合は登録ができない' do
        @dog.reason = 'あ' * 1001
        @dog.valid?
        expect(@dog.errors.full_messages).to include("募集理由は1000文字以内で入力してください")
      end
      it 'remarksが1001文字以上場合は登録ができない' do
        @dog.remarks = 'あ' * 1001
        @dog.valid?
        expect(@dog.errors.full_messages).to include("備考・その他は1000文字以内で入力してください")
      end
    end
  end
  
end

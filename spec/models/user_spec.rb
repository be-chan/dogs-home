require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての値を入力した場合は登録ができる' do
        expect(@user).to be_valid
      end

      it 'building_nameが空でも登録ができる' do
        @user.building_name = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'nicknameが空の場合は登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空の場合は登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end

      it 'emailに一意性がない場合は登録できない' do
        @user.save 
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end

      it 'emailに@が含まれていない場合は登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end

      it 'passwordが空の場合は登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passowordが7文字以下の場合は登録できない' do
        @user.password = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英数字混合8文字以上で入力してください")
      end

      it 'passowordが半角数字のみの場合は登録できない' do
        @user.password = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英数字混合8文字以上で入力してください")
      end

      it 'passowordが半角英字のみの場合は登録できない' do
        @user.password = 'abcdefgi'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英数字混合8文字以上で入力してください")
      end

      it 'passowordが全角の場合は登録できない' do
        @user.password = '１２３４５６７a'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英数字混合8文字以上で入力してください")
      end

      it 'passwordが入力されていても、password_confirmationが空の場合は登
      録できない' do
        @user.password = '1234567a'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end

      it 'passwordとpassword_confirmationが一致していない場合は登録できない' do
        @user.password = '1234567a'
        @user.password_confirmation = '7654321a'
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end

      it 'full_nameが空の場合は登録できない' do
        @user.full_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前を入力してください")
      end

      it 'full_nameが全角(漢字、ひらがな、カタカナ)ではない場合は登録できない' do
        @user.full_name = 'suzuki ithiro'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前は全角(漢字,ひらがな,カタカナ)で入力してください")
      end

      it 'full_name_kanaが空の場合は登録できない' do
         @user.full_name_kana = ''
         @user.valid?
         expect(@user.errors.full_messages).to include("フリガナを入力してください")
      end

      it 'full_name_kanaが全角(カタカナ)ではない場合は登録できない' do
        @user.full_name_kana = '鈴木 一郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナは全角(カタカナで入力してください")
      end

      it 'postal_codeが空の場合は登録できない' do
        @user.postal_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'postal_codeがハイフンなしの場合は登録できない' do
        @user.postal_code = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("郵便番号はハイフンを含めてください")
      end

      it 'prefecture_idが選択されていない場合は登録できない' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("都道府県を選択してください")
      end

      it 'cityが空の場合は登録できない' do
        @user.city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressが空の場合は登録できない' do
        @user.address = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空の場合は登録できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phone_numberにハイフンがある場合は登録できない' do
        @user.phone_number = '090-0000-0000'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は半角数字(ハイフンなし)で入力してください")
      end

      it 'phone_numberが11桁以内でない場合は登録できない' do
        @user.phone_number = '090000000001'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は11桁以内で入力してください")
      end

      it 'phone_numberが英数字混合の場合は登録できない' do
        @user.phone_number = '0900000abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は半角数字(ハイフンなし)で入力してください")
      end

      it 'phone_numberが全角数字の場合は登録できない' do
        @user.phone_number = "０９０００００００００"
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は半角数字(ハイフンなし)で入力してください")
      end

      it 'job_idが選択されていない場合は登録できない' do
        @user.job_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("職業を選択してください")
      end

      it 'age_idが選択されていない場合は登録できない' do
        @user.age_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("年齢を選択してください")
      end

      it 'gender_idが選択されていない場合は登録できない' do
        @user.gender_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("性別を選択してください")
      end

    end
  end
end

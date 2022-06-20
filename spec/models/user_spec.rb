require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'staff_numberが空では登録できない' do
        @user.staff_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Staff number can't be blank")
      end
      it 'staff_numberが数値以外では登録できない' do
        @user.staff_number = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Staff number is not a number")
      end
      it 'staff_numberが重複したら登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.staff_number = @user.staff_number
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Staff number has already been taken")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複したら登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password_digest = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '1234'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英数混合でないと登録できない（全角含む）' do
        @user.password = 'あ123456a'
        @user.password_confirmation = 'あ123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
    end
  end
end
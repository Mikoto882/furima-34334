require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録/ユーザー情報" do
    context 'ユーザー登録ができるとき' do
      it "ニックネームが存在すれば登録できる" do
        @user.nickname = 'test'
        @user.valid?
        expect(@user).to be_valid
      end
      it "メールアドレスが存在すれば登録できる" do
        @user.email = 'test@test'
        @user.valid?
        expect(@user).to be_valid
      end
      it "パスワードは、6文字以上が存在すれば登録できる" do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
      it "パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）" do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること（名字）" do
        @user.last_name = 'ひらがな'
        @user.valid?
        expect(@user).to be_valid
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること（名前）" do
        @user.first_name = 'ひらがな'
        @user.valid?
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること（名字）" do
        @user.last_name_read = 'カタカナ'
        @user.valid?
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること（名前）" do
        @user.first_name_read = 'カタカナ'
        @user.valid?
        expect(@user).to be_valid
      end
      it "生年月日が存在すれば登録できる" do
        @user.birthday = '2000-12-31'
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができないとき' do
      it "ニックネームが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスは＠が含まれていないと登録できないこと" do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "メールアドレスが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "パスワードが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは半角英語のみは登録できない" do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードは数字のみは登録できない" do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードは全角英数混合は登録できない" do
        @user.password = 'ひらab12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードは６文字以上でないと登録できないこと" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "パスワードは、確認用を含めて2回入力すること" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名は、名字が空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザー本名は、名前が空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名（名字）は、全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "ユーザー本名（名前）は、全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "ユーザー本名のフリガナが空だと登録できない（名字）" do
        @user.last_name_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name read can't be blank")
      end
      it "ユーザー本名のフリガナが空だと登録できない（名前）" do
        @user.first_name_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name read can't be blank")
      end
      it "ユーザー本名（名字）のフリガナは全角（カタカナ）以外は登録できない" do
        @user.last_name_read = 'ひらab12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name read is invalid")
      end
      it "ユーザー本名（名前）のフリガナは全角（カタカナ）以外は登録できない" do
        @user.first_name_read = 'ひらab12'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name read is invalid")
      end
      it "生年月日が必須であること" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

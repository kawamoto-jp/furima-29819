require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "全ての項目が埋まっていること" do
        expect(@user).to be_valid
      end
      # it "メールアドレスは半角英数字で、@と.を含み、@の後ろに必ず.が一つ以上必要であること" do
      #   @user.email = "a.a@a.a.jp"
      #   expect(@user).to be_valid
      # end
      # it "パスワードは半角英数字で6文字以上、かつ英数字混合であること、かつパスワードは確認用を含めて2回入力すること" do
      #   @user.password = "aaaa111"
      #   @user.password_confirmation = "aaaa111"
      #   expect(@user).to be_valid
      # end
      # it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      #   @user.last_name = "金子"
      #   @user.first_name = "守"
      #   expect(@user).to be_valid
      # end
      # it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      #   @user.last_name_reading = "カネコ"
      #   @user.first_name_reading = "マモル"
      #   expect(@user).to be_valid
      # end
    end

    context "新規登録がうまくいかないとき" do
      it "nicknameが空の時" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空の時" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する時" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空の時" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが５文字以下の時" do
        @user.password = "aaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordに全角文字が入っている時" do
        @user.password = "あaaaa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordに記号が入っている時" do
        @user.password = "?aaaa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在していてもpassword_confirmationが空の時" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameに全角漢字、ひらがな、カタカナ以外が入っている時" do
        @user.last_name = "ｶﾜﾓﾄ０％"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameに全角漢字、ひらがな、カタカナ以外が入っている時" do
        @user.first_name = "ｶﾜﾓﾄ０％"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_readingに全角カタカナ以外が入っている時" do
        @user.first_name_reading = "東洋＆"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "first_name_readingに全角カタカナ以外が入っている時" do
        @user.last_name_reading = "ありa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid")
      end
      it "birthdayが空の時" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end 
  end

  describe 'ログイン' do
    context 'ログインできる時'
      it 'メールアドレスとパスワードが存在する時' do
        expect(@user).to be_valid
      end
    end
  end
end
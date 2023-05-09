require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.new(email: 'test@test.com', first_name: 'Tester', last_name: 'McTesterson', password: "password", password_confirmation: "password")
      @user.save
    end
    
    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "is not valid when password and password_confirmation don't match" do
      @user.password = 'password'
      @user.password_confirmation = 'passwords'
      expect(@user).to_not be_valid
    end
    
    it 'validates that all fields are filled' do
      expect(@user).to be_valid
    end

    it 'validates that emails are not case sensitive' do
      @user1 = User.new(email: 'TEST@TEST.COM', first_name: 'Tester', last_name: 'Tester', password: "password", password_confirmation: "password")
      expect(@user1).to_not be_valid
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end

    it 'validates that the password must at least six characters' do
      @user.password = "1234"
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.new(email: 'test@test.com', first_name: 'Tester', last_name: 'McTesterson', password: "password", password_confirmation: "password")
      @user.save
    end

    context 'given an email and password on login' do
      it 'will login successfully' do
        @current_user = User.authenticate_with_credentials('test@test.com', 'password')
        expect(@current_user).to eql(@user)
      end

      it 'will not login successfully' do
        @current_user = User.authenticate_with_credentials('test@test.com', 'password1')
        expect(@current_user).to_not eql(@user)
      end

      it 'will login successfully even if there is whitespace around email' do
        @current_user = User.authenticate_with_credentials('   test@test.com  ', 'password')
        expect(@current_user).to eql(@user)
      end

      it 'will login successfully even if user types in the wrong case' do
        @current_user = User.authenticate_with_credentials('teSt@teSt.com', 'password')
        expect(@current_user).to eql(@user)
      end

    end
  end
end
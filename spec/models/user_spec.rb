require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new do |testUser|
        testUser.first_name = 'Tester'
        testUser.last_name = 'McTesterson'
        testUser.email = 'tester@gmail.com'
        testUser.password = 'password'
        testUser.password_confirmation = 'password'
      end
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


  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new do |testUser|
        testUser.first_name = 'Tester'
        testUser.last_name = 'McTesterson'
        testUser.email = 'tester@gmail.com'
        testUser.password = 'password'
        testUser.password_confirmation = 'password'
      end
    end
  end
end
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
  end
end
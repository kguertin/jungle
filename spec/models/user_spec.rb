require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations for User Model' do
    describe 'password validation' do
      it 'should pass validation if created with a password field and a password confirmation field' do
        @user = User.new({:first_name => 'Bort', :last_name => 'Sampson', :email => 'bort@test.com', :password => '12345', :password_confirmation => '12345'})
        expect(@user).to be_valid
      end
      it 'should not be valid if it is missing either password or password confirmation' do
        @user = User.new({:first_name => 'Bort', :last_name => 'Sampson', :email => 'bort@test.com', :password => '12345', :password_confirmation => nil})
        expect(@user).to_not be_valid
      end
      it 'should validate if password and password_confrimation are the same' do
        @user = User.new({:first_name => 'Bort', :last_name => 'Sampson', :email => 'bort@test.com', :password => '12345', :password_confirmation => '12345'})
        expect(@user.password).to eq(@user.password_confirmation)
      end
      it 'should not validate if the password is under 4 characters' do
        @user = User.new({:first_name => 'Bort', :last_name => 'Sampson', :email => 'bort@test.com', :password => '123', :password_confirmation => '123'})
        expect(@user).to_not be_valid
      end
    end

    describe 'email validation' do
      it 'should not be valid if there is no email listed' do
        @user = User.new({:first_name => 'Bort', :last_name => 'Sampson', :email => nil, :password => '12345', :password_confirmation => '12345'})
        expect(@user).to_not be_valid
      end
      it 'should validate if it is a unique user name' do
        User.create({:first_name => 'Bort', :last_name => 'Sampson', :email => 'bort@test.com', :password => '12345', :password_confirmation => '12345'})
        @user = User.new({:first_name => 'Liza', :last_name => 'Sampson', :email => 'bort@test.com', :password => '12345', :password_confirmation => '12345'})
        expect(@user).to_not be_valid
      end
    end   
  end

  describe 'Testing authenticate_with_credentials method' do
    it 'should return the user if the email is regestered' do
      User.create({:first_name => 'Bort', :last_name => 'Sampson', :email => 'bort@test.com', :password => '12345', :password_confirmation => '12345'})
      @user = User.authenticate_with_credentials('bort@test.com', '12345')
      expect(@user.first_name).to eq('Bort')
    end
    it 'should return nil if the email is not regestered' do
      @user = User.authenticate_with_credentials('liza@test.com','1234')
      expect(@user).to eq(nil)
    end
    it 'should still authenticate if email is input with leading or trailing whitespace' do
      User.create({:first_name => 'Bort', :last_name => 'Sampson', :email => 'bort@test.com', :password => '12345', :password_confirmation => '12345'})
      @user = User.authenticate_with_credentials('   bort@test.com   ', '12345')
      expect(@user.first_name).to eq('Bort')
    end
    it 'should not care about case for the email input' do
      User.create({:first_name => 'Bort', :last_name => 'Sampson', :email => 'bort@test.com', :password => '12345', :password_confirmation => '12345'})
      @user = User.authenticate_with_credentials('BORT@test.com', '12345')
      expect(@user.first_name).to eq('Bort')
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
  
    it 'should have the same input for the password field and the password_confirmation field' do
      @user = User.new(firstname: 'Jen', lastname: 'Krabbe', email: 'email@email.com', password: 'password', password_confirmation: 'password')
      expect(@user.password).to eq(@user.password_confirmation) 
    end

    it 'should be invalid without a password field' do
      @user = User.new(firstname: 'Jen', lastname: 'Krabbe', email: 'email@email.com', password: nil, password_confirmation: 'password')
      expect(@user).to_not be_valid 
    end

    it 'should be invalid without a password_confirmation field' do
      @user = User.new(firstname: 'Julia', lastname: 'Barber', email: 'myemail@email.com', password: 'newpassword', password_confirmation: nil)
      expect(@user).to_not be_valid 
    end

    it 'should be invalid without a firstname field' do
      @user = User.new(firstname: nil, lastname: 'Krabbe', email: 'email@email.com', password: 'password', password_confirmation: 'password')
      expect(@user).to_not be_valid 
    end

    it 'should be invalid without a lastname field' do
      @user = User.new(firstname: 'Jen', lastname: nil, email: 'email@email.com', password: 'password', password_confirmation: 'password')
      expect(@user).to_not be_valid 
    end

    it 'should be invalid without an email field' do
      @user = User.new(firstname: 'Jen', lastname: 'Krabbe', email: nil, password: 'password', password_confirmation: 'password')
      expect(@user).to_not be_valid 
    end

    it 'should have a unique email address' do
      @user = User.new(firstname: 'Maureen', lastname: 'Ferguson', email: 'maureen@email.com', password: 'newpassword', password_confirmation: 'newpassword')
      @user.save
      @user2 = User.new(firstname: 'Maureen', lastname: 'Ferguson', email: 'Maureen@email.com', password: 'newpassword', password_confirmation: 'newpassword')
      expect(@user2).to_not be_valid 
    end

    it 'should have a password of at least 8 characters' do
      @user = User.new(firstname: 'Jen', lastname: 'Krabbe', email: 'jensemail@email.com', password: 'passwo', password_confirmation: 'passwo')
      expect(@user).to_not be_valid 
    end

  end
  
end
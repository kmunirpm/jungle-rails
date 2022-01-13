require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do

    # before(:all) do
    #   @category = Category.new
    #   @category.name = 'Test Category'
    #   @category.save!
    # end
    describe 'validations' do

      it "Register: NOT if password is empty" do
        @user = User.new
        @user.first_name = "f_Name"
        @user.last_name = "l_Name"
        @user.email = "fl@test-mail.com"
        @user.password = nil
        @user.password_confirmation = "pwd123456"
        @user.save
  
        expect(@user.errors.messages).to be_present
      end

      it "Register: NOT if password is too short" do 
        @user = User.new
        @user.first_name = "f_Name"
        @user.last_name = "l_Name"
        @user.email = "fl@test-mail.com"
        @user.password = "pw"
        @user.password_confirmation = "pw"
        @user.save
  
        expect(@user.errors.messages).to be_present
      end
      
      it "Register: if password and password_confirmation match" do
        @user = User.new
        @user.first_name = "f_Name"
        @user.last_name = "l_Name"
        @user.email = "fl@test-mail.com"
        @user.password = "pwd123456"
        @user.password_confirmation = "pwd123456"
        @user.save
  
        expect(@user.errors.messages).not_to be_present
      end
  
      it "Register: NOT if password and password_confirmation do not match" do
        @user = User.new
        @user.first_name = "f_Name"
        @user.last_name = "l_Name"
        @user.email = "fl@test-mail.com"
        @user.password = "pwd123456"
        @user.password_confirmation = "pwd2344"
        @user.save
  
        expect(@user.errors.messages).to be_present
      end
  
      it "Register: NOT if first_name is nil" do
        @user = User.new
        @user.first_name = nil
        @user.last_name = "l_Name"
        @user.email = "fl@test-mail.com"
        @user.password = "pwd123456"
        @user.password_confirmation = "pwd123456"
        @user.save
  
        expect(@user.errors.messages).to be_present
      end
  
      it "Register: NOT if last_name is nil" do
        @user = User.new
        @user.first_name = "f_Name"
        @user.last_name = nil
        @user.email = "fl@test-mail.com"
        @user.password = "pwd123456"
        @user.password_confirmation = "pwd123456"
        @user.save
  
        expect(@user.errors.messages).to be_present
      end
  
      it "Register: NOT if email is nil" do
        @user = User.new
        @user.first_name = "f_Name"
        @user.last_name = "l_Name"
        @user.email = nil
        @user.password = "pwd123456"
        @user.password_confirmation = "pwd123456"
        @user.save
  
        expect(@user.errors.messages).to be_present
      end
  
      it "Register: validate email case in-sensitivity" do
        @user = User.new
        @user.first_name = "f_Name"
        @user.last_name = "l_Name"
        @user.email = "FL@TEST-mail.com"
        @user.password = "pwd123456"
        @user.password_confirmation = "pwd123456"
        @user.save
  
        @user1 = User.new
        @user1.first_name = "f_Name2"
        @user1.last_name = "l_Name2"
        @user1.email = "fl@test-mail.com"
        @user1.password = "pwd123456"
        @user1.password_confirmation = "pwd123456"
        @user1.save
  
        expect(@user1.errors.messages).to be_present
      end
  
    end
  
    describe 'User Authentication' do
      it "Return user if email and password are correct" do 
        @user = User.new
        @user.first_name = "f_Name"
        @user.last_name = "l_Name"
        @user.email = "fl@test-mail.com"
        @user.password = "pwd123456"
        @user.password_confirmation = "pwd123456"
        @user.save
  
        authUser = User.authenticate_with_credentials("fl@test-mail.com", "pwd123456")
  
        expect(authUser).to be_present
        expect(authUser).to eq(@user)
      end
  
      it "should not return user if email and/or password are incorrect" do 
        @user = User.new
        @user.first_name = "f_Name"
        @user.last_name = "l_Name"
        @user.email = "fl@test-mail.com"
        @user.password = "pwd123456"
        @user.password_confirmation = "pwd123456"
        @user.save
  
        authUser = User.authenticate_with_credentials("fl@test-mail.com", "pwd")
        expect(authUser).not_to be_present
  
        authUser1 = User.authenticate_with_credentials("test12@test-mail.com", "pwd123456")
        expect(authUser1).not_to be_present
        expect(authUser1).not_to eq(@user)
  
      end
  
      it "should return user if email has spaces or different charaters" do 
  
        @user = User.new
        @user.first_name = "f_Name"
        @user.last_name = "l_Name"
        @user.email = "fl@test-mail.com"
        @user.password = "pwd123456"
        @user.password_confirmation = "pwd123456"
        @user.save
  
        authUser = User.authenticate_with_credentials("   fl@test-mail.com  ", "pwd123456")
        expect(authUser).to be_present
        expect(authUser).to eq(@user)
  
        authUser1 = User.authenticate_with_credentials("fl@test-mail.com", "pwd123456")
        expect(authUser1).to be_present
        expect(authUser1).to eq(@user)
      end
  
    end
    

  end

end
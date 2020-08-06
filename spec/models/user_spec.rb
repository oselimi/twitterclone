require 'rails_helper'

RSpec.describe User, type: :model do
    describe "should be present" do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
    end
    
    describe "email should be uniqueness " do
      #it { should validate_uniqueness_of(:email) }
    end
    
    describe "should be has secure password" do
      it { should have_secure_password }
    end

    describe "minimum or maximum length" do
      it { should validate_length_of(:first_name).is_at_most(User::MAXIMUM_LENGTH_OF_FIRST_NAME) }
      it { should validate_length_of(:last_name).is_at_most(User::MAXIMUM_LENGTH_OF_LAST_NAME) }
      it { should validate_length_of(:email).is_at_most(User::MAXIMUM_LENGTH_OF_EMAIL) }
      it { should validate_length_of(:password).is_at_least(User::MINUMUM_LENGTH_OF_PASSWORD)}
    end

    describe "when email format is invalid" do
      let(:user) { create(:user) }

      it "should be invalid" do
        addresses = %w[user@user,com user_a_user.com example.user@example.]
        addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).not_to be_valid
        end
      end

      it "should be valid" do
        addresses = %w[example@example.com USER_EXample@live.com user+user@live.com ]
        addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end
    end

    describe "when email address is already taken" do      
      it "should donwcase before save" do
        allen = create(:user, email: "EXAMPLE@LIVE.com" )
        expect(allen.email).to eq 'example@live.com'
      end
    end
end

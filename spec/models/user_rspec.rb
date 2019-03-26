require 'rails_helper'

# instatiating an rspec block for User that is in our model.
RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:birth_year) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:chirps) }

  describe 'uniqueness' do
    before :each do # before any test, it will do whatever is in the block.
      create(:user) #creating a user with our factory bot.
    end

    it { should validate_uniqueness_of(:session_token) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'is_password?' do
    let!(:user) { create(:user) } 
    # let! will instatiate the user here right away. (use bang version when saving to db)
    # let will instatiate the user when running the test and when user is called.
    context 'with a valid password' do
      it 'should return true' do
        expect(user.is_password?('starwars')).to be(true)
      end
    end

    context 'with an invalid password' do
      it 'should return false' do
        expect(user.is_password?('startrek')).to be(false)
      end
    end
  end

end


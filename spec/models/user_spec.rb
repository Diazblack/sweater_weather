require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
    it {should have_many(:favorites)}
  end
  describe 'Instance Methods' do
    scenario 'delete_favorites' do
      @user = create(:user, email: "whatever@example.com", password: "password")
      @location_1 = create(:favorite, user: @user, location: "Denver, CO")
      @location_2 = create(:favorite, user: @user, location: "Golden, CO")
      @location_3 = create(:favorite, user: @user, location: "Gadsden, AL")

      expected = @user.delete_favorite(@location_2.location)

      expect(expected.count).to eq(2)
      
      expected.each do |city|
        expect(city.location).to_not eq(@location_2.location)
      end
    end
  end
end

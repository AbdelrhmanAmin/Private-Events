require "rails_helper"

RSpec.describe User, :type => :model do
  context "Creating a new user" do
    it "Will fail because of requirments are not present or invalid [name,email,password]" do
      user = User.create(name: 'test', email: 'max@yahoo.com')
      expect(user).to_not be_valid
    end
    it "Will fail because of requirments are not present or invalid [name,email,password]" do
      user = User.create(name: 'test', email: 'max@yahoo.com', password: nil)
      expect(user).to_not be_valid
    end
    it "Will PASS because ALL of the requirments are PRESENT [name,email,password]" do
      user = User.create(name: 'test', email: 'max@yahoo.com', password: 'thisismypasswordxdlol')
      expect(user).to be_valid
    end
  end
end
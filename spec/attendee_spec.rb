require "rails_helper"

RSpec.describe Attendee, :type => :model do
  context "A user attending an event, requirments for attendance [user_id (NOT THE SAME AS CREATOR_ID), event_id]" do
    it "Will fail because of requirments are not present or invalid" do
      user = User.create(name: 'test', email: 'max@yahoo.com', password: 'thisismypasswordxdlol')
      event = Event.new(title: 'test', date: Date.today)
      attendee = Attendee.new(event_id: event.id)
      expect(event).to_not be_valid
    end
    it "Will fail because of requirments are not present or invalid" do
      user = User.create(name: 'test', email: 'max@yahoo.com', password: 'thisismypasswordxdlol')
      event = Event.new(title: 'test', date: Date.today)
      attendee = Attendee.new(user_id: user.id, event_id: event.id)
      expect(event).to_not be_valid
    end
    it "Will PASS because ALL of the requirments are PRESENT" do
      user = User.create(name: 'test', email: 'max@yahoo.com', password: 'thisismypasswordxdlol')
      event = Event.new(title: 'test', date: Date.today, creator_id: user.id)
      user2 = User.create(name: 'test2', email: 'swag@yolo.com', password: 'thisismypasswordxdlol')
      attendee = Attendee.new(user_id: user2.id, event_id: event.id)
      expect(event).to be_valid
    end
  end
end
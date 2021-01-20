require 'rails_helper'

RSpec.describe Attendee, type: :model do
  context 'A user attending an event, requirments for attendance [user_id (NOT THE SAME AS CREATOR_ID), event_id]' do
    let!(:creator) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:event) { build(:event) }
    it 'Will fail because of requirments are not present or invalid' do
      attendee = Attendee.create(event_id: event.id)
      expect(attendee).to_not be_valid
    end
    it 'Will fail because of requirments are not present or invalid' do
      event.creator_id = creator.id
      event.save!
      attendee = Attendee.create(event_id: event.id)
      expect(attendee).to_not be_valid
    end
    it 'Will PASS because ALL of the requirments are PRESENT' do
      event.creator_id = creator.id
      event.save!
      attendee = Attendee.create(user_id: user2.id, event_id: event.id)
      expect(attendee).to be_valid
    end
  end
end

# rubocop:disable Lint/UselessAssignment
require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Creating a new event' do
    it 'Will fail because of requirments are not present or invalid [title, date, creator_id]' do
      event = Event.create(title: 'test')
      expect(event).to_not be_valid
    end
    it 'Will fail because of requirments are not present or invalid [title, date, creator_id]' do
      user = User.create(name: 'test', email: 'max@yahoo.com', password: 'thisismypasswordxdlol')
      event = Event.new(title: 'test', date: Date.today)
      expect(event).to_not be_valid
    end
    it 'Will PASS because of ALL requirments are PRESENT [title, date]' do
      user = User.create(name: 'test', email: 'max@yahoo.com', password: 'thisismypasswordxdlol')
      event = Event.new(title: 'test', date: Date.today, creator_id: user.id)
      expect(event).to be_valid
    end
  end
end
# rubocop:enable Lint/UselessAssignment

# rubocop:disable Lint/UselessAssignment
require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Creating a new event' do
    let!(:user) {create(:user)}
    let!(:event) {build(:event)}
    it 'Will fail because of requirments are not present or invalid [title, date, creator_id]' do
      expect(event).to_not be_valid
    end
    it 'Will fail because of requirments are not present or invalid [title, date, creator_id]' do
      user.save!
      expect(event).to_not be_valid
    end
    it 'Will PASS because of ALL requirments are PRESENT [title, date]' do
      user.save!
      event.creator_id = user.id
      event.save!
      expect(event).to be_valid
    end
  end
end
# rubocop:enable Lint/UselessAssignment

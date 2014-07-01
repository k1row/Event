require 'rails_helper'

RSpec.describe Event, :type => :model do
	describe '#name' do
		it { should validate_presence_of(:name) }
		it { should ensure_length_of(:name).is_at_most(50) }
	end

	describe '#created_by?' do
		let(:event) { FactoryGirl.create(:event) }
		subject { event.created_by?(user) }

		context '引数がnilな時' do
			let(:user) { nil }
			it { should be_falsey }
		end

		context '#owner_idと引数の#idが同じ時' do
			let(:user) { double('user', id: event.owner_id) }
			it { should be_truthy}
		end
	end
end

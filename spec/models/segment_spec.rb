require 'rails_helper'

RSpec.describe Segment, type: :model do
  it { expect(subject).to have_and_belong_to_many(:applications).join_table('system.applications_segments') }
end

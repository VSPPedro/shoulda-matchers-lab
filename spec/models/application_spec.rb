require 'rails_helper'

RSpec.describe Application, type: :model do
  it { expect(subject).to have_and_belong_to_many(:segments).join_table('system.applications_segments') }
end

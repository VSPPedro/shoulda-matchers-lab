require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  it "after #1381" do
    should allow_value('Broncos', 'Titans').
      for(:sports_team).
      with_message('Must be either a Broncos or Titans fan',
        against: :chosen_sports_team
      )
  end

  it "before #1381" do
    should_not allow_value('Broncooos', 'Titaaans').
      for(:sports_team).
      with_message('Must be either a Broncos fan or a Titans fan',
        against: :chosen_sports_team
      )
  end

  # Why isn't this failing with invalid values?
  it "invalid values" do
    should allow_value('Custom Sport Team 1', 'Custom Sport Team 2').
      for(:sports_team).
      with_message('Must be either a Broncos or Titans fan',
        against: :chosen_sports_team
      )
  end

  # Why isn't this failing with invalid message?
  it "invalid message" do
    should allow_value('Broncos', 'Titans').
      for(:sports_team).
      with_message('Custom message',
        against: :chosen_sports_team
      )
  end
end

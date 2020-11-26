class UserProfile < ApplicationRecord
  validate :sports_team_must_be_valid

  private

  def sports_team_must_be_valid
    if sports_team !~ /^(Broncos|Titans)$/i
      self.errors.add :chosen_sports_team,
        'Must be either a Broncos fan or a Titans fan'
    end
  end
end

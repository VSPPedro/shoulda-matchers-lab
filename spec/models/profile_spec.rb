require 'rails_helper'

RSpec.describe Profile, type: :model do
  # Pass
  it { should delegate_method(:foo).to(:user) }
  # Fail
  # User(id: integer, created_at: datetime, updated_at: datetime) is not a symbol nor a string
  it { should delegate_method(:bar).to(User) }
end

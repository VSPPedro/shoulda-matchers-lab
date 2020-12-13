class Profile < ApplicationRecord
  belongs_to :user

  delegate :foo, to: :user
  delegate :bar, to: User
end

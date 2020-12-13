class Application < ApplicationRecord
  self.table_name = 'system.applications'

  has_and_belongs_to_many :segments, join_table: 'system.applications_segments'
end

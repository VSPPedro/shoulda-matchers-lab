class Segment < ApplicationRecord
  self.table_name = 'system.segments'

  has_and_belongs_to_many :applications, join_table: 'system.applications_segments'
end

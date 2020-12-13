class CreateApplicationsSegments < ActiveRecord::Migration[6.0]
  def change
    create_schema :system

    create_table 'system.applications' do |t|
      t.string :name
    end

    create_table 'system.segments' do |t|
      t.string :name
    end

    create_table 'system.applications_segments' do |t|
      t.belongs_to :application
      t.belongs_to :segment
    end
  end
end

class CreateCompetitionsEvents < ActiveRecord::Migration
  def self.up
    create_table "competitions_events", :id => false do |t|
      t.integer "competition_id", "event_id"
    end
    add_index "competitions_events", "competition_id"
    add_index "competitions_events", "event_id"
  end

  def self.down
    drop_table "competitions_events"
  end
end

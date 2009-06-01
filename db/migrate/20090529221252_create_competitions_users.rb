class CreateCompetitionsUsers < ActiveRecord::Migration
  def self.up
    create_table "competitions_users", :id => false do |t|
      t.integer "competition_id", "user_id"
    end
    add_index "competitions_users", "competition_id"
    add_index "competitions_users", "user_id"
  end

  def self.down
    drop_table "competitions_users"
  end
end

class CreateRulesRulesets < ActiveRecord::Migration
  def self.up
    # create the join table
    create_table "rules_rulesets", :id => false do |t|
      t.integer "rule_id", "ruleset_id"
    end
    add_index "rules_rulesets", "rule_id"
    add_index "rules_rulesets", "ruleset_id"
  end

  def self.down
    drop_table "rules_rulesets"
  end
end

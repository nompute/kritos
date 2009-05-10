class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.string :name
      t.string :description
      t.decimal :deduction, :precision => 3, :scale => 2
    end
  end

  def self.down
    drop_table :rules
  end
end

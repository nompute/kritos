class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.string :name
      t.string :description
    end
  end

  def self.down
    drop_table :permissions
  end
end

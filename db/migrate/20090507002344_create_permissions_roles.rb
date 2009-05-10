class CreatePermissionsRoles < ActiveRecord::Migration
  def self.up
    create_table :permissions_roles, :id => false do |t|
      t.integer :permission_id
      t.integer :role_id
    end
  end

  def self.down
    drop_table :permission_roles
  end
end

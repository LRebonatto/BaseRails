class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable
      t.trackable
      t.timestamps
      t.recoverable
    end

    add_index :users, :email,                :unique => true
  end

  def self.down
    drop_table :users
  end
end
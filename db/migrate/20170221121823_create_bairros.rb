class CreateBairros < ActiveRecord::Migration
  def self.up
    create_table :bairros do |t|
      t.string   :nome,               :null => false
      t.integer  :status,             :null => false, :default => 0
      t.integer  :deleted,            :null => false, :default => 0
      t.integer  :user_id,            :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :bairros
  end
end

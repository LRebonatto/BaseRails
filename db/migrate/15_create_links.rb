class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string   :nome,               :null => false
      t.string   :site,               :null => false
      t.integer  :posicao,            :null => false, :default => 0
      t.integer  :user_id,            :null => false
      t.integer  :status,             :null => false, :default => 0
      t.integer  :deleted,            :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end

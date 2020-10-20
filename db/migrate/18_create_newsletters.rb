class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.string   :nome,               :null => false
      t.string   :email,              :null => false
      t.integer  :status,             :null => false, :default => 0
      t.integer  :deleted,            :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters
  end
end

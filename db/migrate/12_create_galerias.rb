class CreateGalerias < ActiveRecord::Migration
  def self.up
    create_table :galerias do |t|
      t.string   :nome,               :null => false
      t.text     :descricao,          :null => true
      t.string   :slug,               :null => false
      t.integer  :posicao,            :null => false, :default => 0
      t.integer  :user_id,            :null => false
      t.integer  :acessos,            :null => false, :default => 0
      t.integer  :status,             :null => false, :default => 0
      t.integer  :deleted,            :null => false, :default => 0
      t.timestamps
    end

    add_index :galerias, :slug, :unique => true
  end

  def self.down
    drop_table :galerias
  end
end
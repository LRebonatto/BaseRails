class CreateParceiros < ActiveRecord::Migration
  def self.up
    create_table :parceiros do |t|
      t.string   :nome,               :null => false
      t.string   :site,               :null => false
      t.string   :capa_file_name,     :null => false
      t.string   :capa_content_type,  :null => true
      t.integer  :capa_file_size,     :null => true
      t.datetime :capa_updated_at,    :null => true
      t.integer  :posicao,            :null => false, :default => 0
      t.integer  :user_id,            :null => false
      t.integer  :status,             :null => false, :default => 0
      t.integer  :deleted,            :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :parceiros
  end
end

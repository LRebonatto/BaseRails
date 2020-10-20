class CreateNoticias < ActiveRecord::Migration
  def self.up
    create_table :noticias do |t|
      t.string   :nome,               :null => false
      t.text     :descricao,          :null => false, :limit => 5000
      t.string   :slug,               :null => false
      t.string   :capa_file_name,     :null => false
      t.string   :capa_content_type,  :null => true
      t.integer  :capa_file_size,     :null => true
      t.datetime :capa_updated_at,    :null => true
      t.integer  :user_id,            :null => false
      t.integer  :status,             :null => false, :default => 0
      t.integer  :deleted,            :null => false, :default => 0
      t.timestamps
    end

    add_index :noticias, :slug, :unique => true
  end

  def self.down
    drop_table :noticias
  end
end

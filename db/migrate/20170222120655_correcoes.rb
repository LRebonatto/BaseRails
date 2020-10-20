class Correcoes < ActiveRecord::Migration
  def self.up
    drop_table :bairros
    drop_table :instituicao_categorias
    drop_table :instituicoes

    create_table :bairros do |t|
      t.string   :nome,               :null => false
      t.integer  :status,             :null => false, :default => 0
      t.integer  :deleted,            :null => false, :default => 0
      t.integer  :user_id,            :null => false
      t.timestamps
    end
    create_table :instituicao_categorias do |t|
      t.string   :nome,               :null => false
      t.integer  :status,             :null => false, :default => 0
      t.integer  :deleted,            :null => false, :default => 0
      t.integer  :user_id,            :null => false
      t.timestamps
    end

    create_table :instituicoes do |t|
      t.string   :nome,               :null => false
      t.integer  :status,             :null => false, :default => 0
      t.integer  :deleted,            :null => false, :default => 0
      t.references :instituicao_categoria, :index => true, :foreign_key => true
      t.integer  :user_id,            :null => false
      t.timestamps
    end
    
  end

  def self.down
    drop_table :bairros
    drop_table :instituicao_categorias
    drop_table :instituicoes
  end
end


class CreateContatos < ActiveRecord::Migration
  def self.up
    create_table :contatos do |t|
      t.string   :nome,               :null => false
      t.string   :telefone,           :null => true
      t.string   :email,              :null => false
      t.text     :mensagem,           :null => false
      t.integer  :status,             :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :contatos
  end
end
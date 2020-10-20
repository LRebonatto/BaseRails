class CreateFichas < ActiveRecord::Migration
  def self.up
    create_table :fichas do |t|
      t.string   :nome,                    :null => false
      t.string   :idade,                   :null => true
      t.string   :nascimento,              :null => false
      t.string   :endereco,                :null => false
      t.string   :numero,                  :null => true
      t.string   :bairro,                  :null => false
      t.string   :referencia,              :null => true
      t.string   :instituicao,             :null => false
      t.string   :periodo,                 :null => false
      t.string   :serie,                   :null => true
      t.string   :turma,                   :null => true
      t.string   :sala,                    :null => true
      t.string   :professor,               :null => true
      t.string   :responsavel,             :null => true
      t.string   :nome_pai,                :null => false
      t.string   :rg_pai,                  :null => true
      t.string   :cpf_pai,                 :null => true
      t.string   :data_nascimento_pai,     :null => true
      t.string   :local_trabalho_pai,      :null => true
      t.string   :fone_comercial_pai,      :null => true
      t.string   :fone_residencial_pai,    :null => true
      t.string   :celular_pai,             :null => false
      t.string   :email_pai,               :null => true
      t.string   :nome_mae,                :null => true
      t.string   :rg_mae,                  :null => true
      t.string   :cpf_mae,                 :null => true
      t.string   :data_nascimento_mae,     :null => true
      t.string   :local_trabalho_mae,      :null => true
      t.string   :fone_comercial_mae,      :null => true
      t.string   :fone_residencial_mae,    :null => true
      t.string   :celular_mae,             :null => true
      t.string   :email_mae,               :null => true
      t.integer  :status,                  :null => false, :default => 0
      t.integer  :deleted,                 :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :fichas
  end
end
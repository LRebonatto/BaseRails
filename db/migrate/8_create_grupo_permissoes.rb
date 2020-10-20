class CreateGrupoPermissoes < ActiveRecord::Migration
  def self.up
    create_table :grupo_permissoes do |t|
      t.integer  :permissao_id,          :null => false
      t.integer  :grupo_id,              :null => false
    end
  end

  def self.down
    drop_table :grupo_permissoes
  end
end
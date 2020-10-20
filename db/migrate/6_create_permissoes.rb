class CreatePermissoes < ActiveRecord::Migration
  def self.up
    create_table :permissoes do |t|
      t.string   :descricao,           :null => false
    end
  end

  def self.down
    drop_table :permissoes
  end
end
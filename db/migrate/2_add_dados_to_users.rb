class AddDadosToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :administrador,          :integer,     :default => 0
    add_column :users, :nome_completo,          :string,      :null => false
    add_column :users, :grupo_id,               :integer,     :null => false, :default => 0
  end

  def self.down
    remove_column :users, :administrador
    remove_column :users, :nome_completo
    remove_column :users, :grupo_id
  end
end
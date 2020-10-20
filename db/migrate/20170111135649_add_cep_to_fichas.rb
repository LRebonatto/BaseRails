class AddCepToFichas < ActiveRecord::Migration
  def self.up
    add_column :fichas, :cep, :string
  end

  def self.down
    remove_column :fichas, :cep, :string
  end
end

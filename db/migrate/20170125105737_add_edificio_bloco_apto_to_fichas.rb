class AddEdificioBlocoAptoToFichas < ActiveRecord::Migration
  def self.up
  	add_column :fichas, :edificio, :string
  	add_column :fichas, :bloco, :string
  	add_column :fichas, :apto, :string
  end

  def self.down
  	add_column :fichas, :edificio, :string
  	add_column :fichas, :bloco, :string
  	add_column :fichas, :apto, :string
  end
end

class CreateGrupos < ActiveRecord::Migration
  def self.up
    create_table :grupos do |t|
      t.string   :descricao,           :null => false
    end
  end

  def self.down
    drop_table :grupos
  end
end
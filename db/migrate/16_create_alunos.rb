class CreateAlunos < ActiveRecord::Migration
  def self.up
    create_table :alunos do |t|
      t.string   :nome,               :null => false
      t.date     :data_nascimento,    :null => false
      t.integer  :user_id,            :null => false
      t.integer  :status,             :null => false, :default => 0
      t.integer  :deleted,            :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :alunos
  end
end

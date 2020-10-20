class Aluno < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :nome, :message => 'não pode ficar em branco.'
  validates_presence_of :data_nascimento, :message => 'não pode ficar em branco.'
  validates_presence_of :user_id, :message => 'não pode ficar em branco.'
end
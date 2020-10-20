class Ficha < ActiveRecord::Base
  validates_presence_of :nome, :message => 'não pode ficar em branco.'
  validates_presence_of :cep, :message => 'não pode ficar em branco.'
  validates_presence_of :nascimento, :message => 'não pode ficar em branco.'
  validates_presence_of :endereco, :message => 'não pode ficar em branco.'
  validates_presence_of :bairro, :message => 'não pode ficar em branco.'
  validates_presence_of :instituicao, :message => 'não pode ficar em branco.'
  validates_presence_of :periodo, :message => 'não pode ficar em branco.'
  validates_presence_of :nome_pai, :message => 'não pode ficar em branco.'
  validates_presence_of :celular_pai, :message => 'não pode ficar em branco.'
end
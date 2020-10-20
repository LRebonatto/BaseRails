class Contato < ActiveRecord::Base
  validates_presence_of :nome, :message => "não pode ficar em branco"
  validates_presence_of :email, :message => "não pode ficar em branco"
  validates_presence_of :mensagem, :message => "não pode ficar em branco"
end
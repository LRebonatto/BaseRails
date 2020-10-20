class Permissao < ActiveRecord::Base
  validates_presence_of :descricao, :message => "não pode ficar em branco."
end
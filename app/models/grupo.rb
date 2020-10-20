class Grupo < ActiveRecord::Base
  has_many :users

  validates_presence_of :descricao, :message => "não pode ficar em branco."
end
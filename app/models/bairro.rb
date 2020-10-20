class Bairro < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :nome, :message => 'não pode ficar em branco.'
end

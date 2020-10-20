class Instituicao < ActiveRecord::Base
	#belongs_to :instituicao_categoria
	belongs_to :user
  	belongs_to :instituicao_categoria, :class_name => "InstituicaoCategoria", :foreign_key => "instituicao_categoria_id"
  	validates_presence_of :nome, :message => 'não pode ficar em branco.'
end

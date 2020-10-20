class InstituicaoCategoria < ActiveRecord::Base
	 belongs_to :user
	 #has_many :instituicoes
  	has_many :instituicoes, :class_name => "Instituicao", :foreign_key => "instituicao_categoria_id"

  	validates_presence_of :nome, :message => 'não pode ficar em branco.'
end

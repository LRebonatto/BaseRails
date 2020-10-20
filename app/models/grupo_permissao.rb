class GrupoPermissao < ActiveRecord::Base
  belongs_to :grupo
  belongs_to :permissao

  validates_presence_of :grupo_id, :message => "não pode ficar em branco."
  validates_presence_of :permissao_id, :message => "não pode ficar em branco."
end
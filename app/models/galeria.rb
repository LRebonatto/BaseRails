class Galeria < ActiveRecord::Base
  belongs_to :user
  has_many   :images

  accepts_nested_attributes_for :images, :allow_destroy => true

  validates_presence_of :nome, :message => 'não pode ficar em branco.'
  validates_presence_of :descricao, :message => 'não pode ficar em branco.'
  validates_presence_of :slug, :message => 'não pode ficar em branco.'
  validates_presence_of :user_id, :message => 'não pode ficar em branco.'
end
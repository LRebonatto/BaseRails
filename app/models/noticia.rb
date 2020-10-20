class Noticia < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :nome, :message => 'não pode ficar em branco.'
  validates_presence_of :descricao, :message => 'não pode ficar em branco.'
  validates_presence_of :slug, :message => 'não pode ficar em branco.'
  validates_presence_of :user_id, :message => 'não pode ficar em branco.'

  has_attached_file :capa, :styles => { :thumb => "215x140#", :medium => "x300>" },
                                        :convert_options => {
                                          :thumb  => "-quality 85",
                                          :medium => "-quality 85"
                                        }

  validates_attachment_presence :capa, :message => 'não pode ficar em branco'
  validates_attachment_size :capa, :less_than => 3.megabytes
  validates_attachment_content_type :capa, :content_type => ['image/jpeg',
                                                             'image/png',
                                                             'image/jpg',
                                                             'image/gif']
end
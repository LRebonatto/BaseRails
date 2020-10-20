class User < ActiveRecord::Base
  belongs_to :cidade
  belongs_to :grupo

  has_attached_file :imagem_perfil, :styles => { :thumb => "74x74", :normal => "128x131" },
                                                 :convert_options => { 
                                                   :thumb => "-compose Copy -gravity center -extent 74x74 -quality 85",
                                                   :normal => "-compose Copy -gravity center -extent 128x131 -quality 85"
                                                 }

  validates_attachment_size :imagem_perfil, :less_than => 2.megabytes
  validates_attachment_content_type :imagem_perfil, :content_type => ['image/jpeg', 
                                                             'image/png', 
                                                             'image/jpg', 
                                                             'image/gif']

  devise :database_authenticatable, :trackable, :timeoutable, :registerable, :validatable, :recoverable
  attr_accessible :email, :password, :password_confirmation, :administrador, :nome_completo, :grupo_id, :imagem_perfil

  validates_presence_of :nome_completo,          :message => "não pode ficar em branco."
  validates_presence_of :grupo_id,               :message => "não pode ficar em branco."

  validates_uniqueness_of :email,                :message => "já existe no cadastro de usuários."
end
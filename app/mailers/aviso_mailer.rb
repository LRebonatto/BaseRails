class AvisoMailer < ActionMailer::Base
  default :from => "Transportes Anacar <website@agenciatwoweb.com.br>", :reply_to => "website@transportesanacar.com.br"

  def contato(dados)
    @dados = dados
    mail(:to => "anacartransporte@yahoo.com", :subject => "Transportes Anacar - Contato através do Site")
  end

  def cadastro(dados)
    @dados = dados
    mail(:to => "anacartransporte@yahoo.com", :subject => "Transportes Anacar - Novo Cadastro no Site")
  end
end
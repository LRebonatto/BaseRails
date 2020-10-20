class ContatosController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(10)
  end

  def index
    @contatos = Contato.order("status ASC, created_at DESC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(11)
  end

  def show
    @contato = Contato.find(params[:id])
  end

  def new
    @contato = Contato.new
  end

  def create
    #Faz validação recaptcha 
		return render_invalid_recaptcha if !correct_recaptcha?

    @contato = Contato.new(params[:contato])
    if @contato.save
      AvisoMailer.contato(@contato).deliver
      redirect_to home_contato_url, :notice => "Sua Mensagem foi enviada com Sucesso! Em Breve nossa Equipe irá entrar em Contato com você!"
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(9)
  end

  def destroy
    @contato = Contato.find(params[:id])
    @contato.destroy
    redirect_to contatos_url, :notice => "O Contato foi apagado com sucesso."
  end
  
  before_filter(:only => [:alterar_status]) do
     valida_permissao(12)
  end

  def alterar_status
    @contato = Contato.find(params[:contato_id])
    @contato.update_attributes(:status => 1)
    redirect_to contatos_url, :notice => "O Contato foi Marcado como Lido."
  end

  private

  def resolve_layout
    case action_name
    when "new"
      "application"
    when "create"
      "application"
    else
      "arearestrita"
    end
  end
end
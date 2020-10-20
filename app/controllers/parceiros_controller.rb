class ParceirosController < ApplicationController
  before_filter :authenticate_user!, :except => [:exibir]
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(12)
  end

  def index
    @parceiros = Parceiro.where(:deleted => 0).order("posicao ASC, nome ASC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(13)
  end

  def show
    @parceiro = Parceiro.find(params[:id])
  end
  
  before_filter(:only => [:new, :create]) do
     valida_permissao(9)
  end

  def new
    @parceiro = Parceiro.new
  end

  def create
    @parceiro = Parceiro.new(params[:parceiro])
    @parceiro.user_id = current_user.id
    if @parceiro.save
      redirect_to @parceiro, :notice => "O Parceiro foi adicionado com sucesso."
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:edit, :update]) do
     valida_permissao(10)
  end

  def edit
    @parceiro = Parceiro.find(params[:id])
  end

  def update
    @parceiro = Parceiro.find(params[:id])
    if @parceiro.update_attributes(params[:parceiro])
      redirect_to @parceiro, :notice  => "O Parceiro foi atualizado com sucesso."
    else
      render :action => 'edit'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(11)
  end

  def destroy
    @parceiro = Parceiro.find(params[:id])
    @parceiro.update_attributes(:deleted => 1)
    redirect_to parceiros_url, :notice => "O Parceiro foi apagado com sucesso."
  end

  def exibir
    @parceiro = Parceiro.find(params[:parceiro_id])
  end

  private

  def resolve_layout
    case action_name
    when "exibir"
      "application"
    else
      "arearestrita"
    end
  end
end
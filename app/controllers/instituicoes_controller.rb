class InstituicoesController < ApplicationController
  before_filter :authenticate_user!
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(46)
  end

  def index
    @instituicoes = Instituicao.where(:deleted => 0).order("nome ASC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(47)
  end

  def show
    @instituicao = Instituicao.find(params[:id])
  end
  
  before_filter(:only => [:new, :create]) do
     valida_permissao(43)
  end

  def new
    @instituicao = Instituicao.new
    @instituicao_categorias = InstituicaoCategoria.where(:deleted => 0).order("nome ASC").all
  end

  def create
    @instituicao = Instituicao.new(params[:instituicao])
    @instituicao.user_id = current_user.id
    if @instituicao.save
      redirect_to @instituicao, :notice => "A Instituição foi adicionada com sucesso."
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:edit, :update]) do
     valida_permissao(44)
  end

  def edit
    @instituicao = Instituicao.find(params[:id])
    @instituicao_categorias = InstituicaoCategoria.where(:deleted => 0).order("nome ASC").all
    
  end

  def update
    @instituicao = Instituicao.find(params[:id])
    if @instituicao.update_attributes(params[:instituicao])
      redirect_to @instituicao, :notice  => "A Instituição foi atualizada com sucesso."
    else
      render :action => 'edit'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(45)
  end

  def destroy
    @instituicao = Instituicao.find(params[:id])
    @instituicao.update_attributes(:deleted => 1)
    redirect_to bairros_url, :notice => "A Instituição foi apagada com sucesso."
  end

  private

  def resolve_layout
    #case action_name
    #when "exibir"
    #  "application"
    #else
      "arearestrita"
    #end
  end
end

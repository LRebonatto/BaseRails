class InstituicaoCategoriasController < ApplicationController
  before_filter :authenticate_user!
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(46)
  end

  def index
    @instituicao_categorias = InstituicaoCategoria.where(:deleted => 0).order("nome ASC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(47)
  end

  def show
    @instituicao_categoria = InstituicaoCategoria.find(params[:id])
  end
  
  before_filter(:only => [:new, :create]) do
     valida_permissao(43)
  end

  def new
    @instituicao_categoria = InstituicaoCategoria.new
  end

  def create
    @instituicao_categoria = InstituicaoCategoria.new(params[:instituicao_categoria])
    @instituicao_categoria.user_id = current_user.id
    if @instituicao_categoria.save
      redirect_to @instituicao_categoria, :notice => "A Categoria de Instituição foi adicionada com sucesso."
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:edit, :update]) do
     valida_permissao(44)
  end

  def edit
    @instituicao_categoria = InstituicaoCategoria.find(params[:id])
  end

  def update
    @instituicao_categoria = InstituicaoCategoria.find(params[:id])
    if @instituicao_categoria.update_attributes(params[:instituicao_categoria])
      redirect_to @instituicao_categoria, :notice  => "A Categoria de Instituição foi atualizada com sucesso."
    else
      render :action => 'edit'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(45)
  end

  def destroy
    @instituicao_categoria = InstituicaoCategoria.find(params[:id])
    @instituicao_categoria.update_attributes(:deleted => 1)
    redirect_to bairros_url, :notice => "A Categoria de Instituição foi apagada com sucesso."
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

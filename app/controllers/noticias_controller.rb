class NoticiasController < ApplicationController
  before_filter :authenticate_user!, :except => [:exibir]
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(31)
  end

  def index
    @noticias = Noticia.where(:deleted => 0).order("created_at DESC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(32)
  end

  def show
    @noticia = Noticia.find(params[:id])
  end
  
  before_filter(:only => [:new, :create]) do
     valida_permissao(28)
  end

  def new
    @noticia = Noticia.new
  end

  def create
    @noticia = Noticia.new(params[:noticia])
    @noticia.user_id = current_user.id
    if @noticia.save
      redirect_to @noticia, :notice => "A Notícia foi adicionada com sucesso."
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:edit, :update]) do
     valida_permissao(29)
  end

  def edit
    @noticia = Noticia.find(params[:id])
  end

  def update
    @noticia = Noticia.find(params[:id])
    if @noticia.update_attributes(params[:noticia])
      redirect_to @noticia, :notice  => "A Notícia foi atualizada com sucesso."
    else
      render :action => 'edit'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(30)
  end

  def destroy
    @noticia = Noticia.find(params[:id])
    @noticia.update_attributes(:deleted => 1)
    redirect_to noticias_url, :notice => "A Notícia foi apagada com sucesso."
  end

  def exibir
    @noticia = Noticia.find(params[:noticia_id])
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
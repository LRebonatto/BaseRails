class LinksController < ApplicationController
  before_filter :authenticate_user!
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(36)
  end

  def index
    @links = Link.where(:deleted => 0).order("posicao ASC, nome ASC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(37)
  end

  def show
    @link = Link.find(params[:id])
  end
  
  before_filter(:only => [:new, :create]) do
     valida_permissao(33)
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    @link.user_id = current_user.id
    if @link.save
      redirect_to @link, :notice => "O Link foi adicionado com sucesso."
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:edit, :update]) do
     valida_permissao(34)
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      redirect_to @link, :notice  => "O Link foi atualizado com sucesso."
    else
      render :action => 'edit'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(35)
  end

  def destroy
    @link = Link.find(params[:id])
    @link.update_attributes(:deleted => 1)
    redirect_to links_url, :notice => "O Link foi apagado com sucesso."
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
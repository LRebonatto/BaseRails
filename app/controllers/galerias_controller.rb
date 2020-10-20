class GaleriasController < ApplicationController
  before_filter :authenticate_user!, :except => [:filtrar, :exibir, :exibir_imagem]
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(26)
  end

  def index
    @galerias = Galeria.where(:deleted => 0).order("posicao ASC, nome ASC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(27)
  end

  def show
    @galeria = Galeria.find(params[:id])
    @images =  Image.where(:deleted => 0, :galeria_id => @galeria.id).order("capa DESC").all
  end
  
  before_filter(:only => [:new, :create]) do
     valida_permissao(23)
  end

  def new
    @galeria = Galeria.new
    5.times { @galeria.images.build }
  end

  def create
    @galeria = Galeria.new(params[:galeria])
    @galeria.user_id = current_user.id
    if @galeria.save
      redirect_to @galeria, :notice => "A Galeria foi adicionada com sucesso."
    else
      5.times { @galeria.images.build }
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:edit, :update]) do
     valida_permissao(24)
  end

  def edit
    @galeria = Galeria.find(params[:id])
    5.times { @galeria.images.build }
  end

  def update
    @galeria = Galeria.find(params[:id])
    if @galeria.update_attributes(params[:galeria])
      redirect_to @galeria, :notice  => "A Galeria foi atualizada com sucesso."
    else
      5.times { @galeria.images.build }
      render :action => 'edit'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(25)
  end

  def destroy
    @galeria = Galeria.find(params[:id])
    @galeria.update_attributes(:deleted => 1)
    redirect_to galerias_url, :notice => "A Galeria foi apagada com sucesso."
  end

  def exibir
    @galeria = Galeria.find(params[:galeria_id])
    @images =  Image.where(:deleted => 0, :galeria_id => @galeria.id).order("capa DESC").all
  end

  def exibir_imagem
    @image = Image.find(params[:id])
    @galeria = Galeria.find(@image.galeria_id)
  end

  private

  def resolve_layout
    case action_name
    when "filtrar"
      "application"
    when "exibir"
      "application"
    when "exibir_imagem"
      "application"
    else
      "arearestrita"
    end
  end
end
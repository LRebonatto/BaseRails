class BairrosController < ApplicationController
  before_filter :authenticate_user!
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(46)
  end

  def index
    @bairros = Bairro.where(:deleted => 0).order("nome ASC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(47)
  end

  def show
    @bairro = Bairro.find(params[:id])
  end
  
  before_filter(:only => [:new, :create]) do
     valida_permissao(43)
  end

  def new
    @bairro = Bairro.new
  end

  def create
    @bairro = Bairro.new(params[:bairro])
    @bairro.user_id = current_user.id
    if @bairro.save
      redirect_to @bairro, :notice => "O Bairro foi adicionado com sucesso."
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:edit, :update]) do
     valida_permissao(44)
  end

  def edit
    @bairro = Bairro.find(params[:id])
  end

  def update
    @bairro = Bairro.find(params[:id])
    if @bairro.update_attributes(params[:bairro])
      redirect_to @bairro, :notice  => "O Bairro foi atualizado com sucesso."
    else
      render :action => 'edit'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(45)
  end

  def destroy
    @bairro = Bairro.find(params[:id])
    @bairro.update_attributes(:deleted => 1)
    redirect_to bairros_url, :notice => "O Bairro foi apagado com sucesso."
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
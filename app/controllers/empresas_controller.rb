class EmpresasController < ApplicationController
  before_filter :authenticate_user!
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(46)
  end

  def index
    @empresas = Empresa.where(:deleted => 0).order("nome ASC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(47)
  end

  def show
    @empresa = Empresa.find(params[:id])
  end
  
  before_filter(:only => [:new, :create]) do
     valida_permissao(43)
  end

  def new
    @empresa = Empresa.new
  end

  def create
    @empresa = Empresa.new(params[:empresa])
    @empresa.user_id = current_user.id
    if @empresa.save
      redirect_to @empresa, :notice => "A Empresa foi adicionada com sucesso."
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:edit, :update]) do
     valida_permissao(44)
  end

  def edit
    @empresa = Empresa.find(params[:id])
  end

  def update
    @empresa = Empresa.find(params[:id])
    if @empresa.update_attributes(params[:empresa])
      redirect_to @empresa, :notice  => "A Empresa foi atualizada com sucesso."
    else
      render :action => 'edit'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(45)
  end

  def destroy
    @empresa = Empresa.find(params[:id])
    @empresa.update_attributes(:deleted => 1)
    redirect_to empresas_url, :notice => "A Empresa foi apagada com sucesso."
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
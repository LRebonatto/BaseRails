class DepoimentosController < ApplicationController
  before_filter :authenticate_user!
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(46)
  end

  def index
    @depoimentos = Depoimento.where(:deleted => 0).order("nome ASC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(47)
  end

  def show
    @depoimento = Depoimento.find(params[:id])
  end
  
  before_filter(:only => [:new, :create]) do
     valida_permissao(43)
  end

  def new
    @depoimento = Depoimento.new
  end

  def create
    @depoimento = Depoimento.new(params[:depoimento])
    @depoimento.user_id = current_user.id
    if @depoimento.save
      redirect_to @depoimento, :notice => "A Depoimento foi adicionada com sucesso."
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:edit, :update]) do
     valida_permissao(44)
  end

  def edit
    @depoimento = Depoimento.find(params[:id])
  end

  def update
    @depoimento = Depoimento.find(params[:id])
    if @depoimento.update_attributes(params[:depoimento])
      redirect_to @depoimento, :notice  => "A Depoimento foi atualizada com sucesso."
    else
      render :action => 'edit'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(45)
  end

  def destroy
    @depoimento = Depoimento.find(params[:id])
    @depoimento.update_attributes(:deleted => 1)
    redirect_to depoimentos_url, :notice => "A Depoimento foi apagada com sucesso."
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
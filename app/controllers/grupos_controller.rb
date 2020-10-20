class GruposController < ApplicationController
  before_filter :authenticate_user!
  before_filter :valida_admin

  layout :resolve_layout

  def index
    @grupos = Grupo.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @grupo = Grupo.find(params[:id])
  end

  def new
    @grupo = Grupo.new
  end

  def create
    @grupo = Grupo.new(params[:grupo])
    if @grupo.save
      redirect_to @grupo, :notice => "O Grupo foi adicionado com sucesso."
    else
      render :action => 'new'
    end
  end

  def edit
    @grupo = Grupo.find(params[:id])
  end

  def update
    @grupo = Grupo.find(params[:id])
    if @grupo.update_attributes(params[:grupo])
      redirect_to @grupo, :notice  => "O Grupo foi atualizado com sucesso."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @grupo = Grupo.find(params[:id])
    @grupo.save
    redirect_to grupos_url, :notice => "O Grupo foi apagado com sucesso."
  end

  private

  def resolve_layout
    #case action_name
    #when "exibir_post"
    #  "application"
    #else
    #  "arearestrita"
    #end
    "arearestrita"
  end

end
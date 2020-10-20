class PermissoesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :valida_admin
  layout :resolve_layout

  def index
    @permissoes = Permissao.all.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @permissao = Permissao.new
  end

  def create
    @permissao = Permissao.new(params[:permissao])
    if @permissao.save
      redirect_to permissoes_url, :notice => "A Permissão foi adicionada com sucesso."
    else
      render :action => 'new'
    end
  end

  def edit
    @permissao = Permissao.find(params[:id])
  end

  def update
    @permissao = Permissao.find(params[:id])
    if @permissao.update_attributes(params[:permissao])
      redirect_to permissoes_url, :notice  => "A Permissão foi atualizada com sucesso."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @permissao = Permissao.find(params[:id])
    @permissao.destroy
    redirect_to permissoes_url, :notice => "A Permissão foi apagada com sucesso."
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
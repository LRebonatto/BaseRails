class GrupoPermissoesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :valida_admin
  layout :resolve_layout

  def new
    @grupo_permissao = GrupoPermissao.new
    @permissoes = Permissao.where("id NOT IN(SELECT permissao_id FROM grupo_permissoes WHERE grupo_id = #{params[:grupo_id]})").all
  end

  def create 
    @grupo_permissao = GrupoPermissao.new(params[:grupo_permissao])
    @permissoes = Permissao.where("id NOT IN(SELECT permissao_id FROM grupo_permissoes WHERE grupo_id = #{@grupo_permissao.grupo_id})").all
    if @grupo_permissao.save
      redirect_to grupo_url(:id => @grupo_permissao.grupo_id), :notice => "A Permissão no Grupo foi adicionada com sucesso."
    else
      params[:grupo_id] = @grupo_permissao.grupo_id
      render :action => 'new'
    end
  end

  def destroy
    @grupo_permissao = GrupoPermissao.find(params[:id])
    @grupo = @grupo_permissao.grupo_id
    @grupo_permissao.destroy
    redirect_to grupo_url(@grupo), :notice => "A Permissão no Grupo foi apagada com sucesso."
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
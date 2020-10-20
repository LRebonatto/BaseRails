module ApplicationHelper
  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :alert then "alert alert-danger"
    end
  end

  def valida_permissao(codigo)
    @grupo_permissao = GrupoPermissao.where(:grupo_id => current_user.grupo_id, :permissao_id => codigo).first
    if @grupo_permissao.blank?
      redirect_to arearestrita_url, :alert => "Você não possui permissão para acessar esta área."
    end
  end

  def valida_menu(codigo)
    @grupo_permissao = GrupoPermissao.where(:grupo_id => current_user.grupo_id, :permissao_id => codigo).first
    if @grupo_permissao.blank?
      return false
    else
      return true
    end
  end

  def valida_admin
    if current_user.administrador != 1
      redirect_to arearestrita_url, :alert => "Você não possui permissão para acessar esta área."
    end
  end

end
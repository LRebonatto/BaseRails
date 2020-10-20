class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!
  layout :resolve_layout
  
  before_filter(:only => [:new, :create]) do
     valida_permissao(1)
  end

  def new
    super
  end

  def create
    build_resource
    
    if resource.save
      #AvisoMailer.send_email_cadastro(resource.email, resource).deliver
      flash[:notice] = "O novo usuário foi cadastrado com sucesso."
      after_sign_up_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
      flash[:error] = "Não foi possível criar a conta, verifique o preenchimento dos dados e tente novamente."
    end
  end

  before_filter(:only => [:edit, :update]) do
     valida_permissao(2)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:user][:id])

    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    
    if @user.update_attributes(params[:user])
      redirect_to users_url, :notice  => "Os dados do Usuário foram Atualizados com Sucesso."
    else
      render :action => 'edit'
    end
  end

  before_filter(:only => [:editar_perfil, :update_perfil]) do
     valida_permissao(6)
  end

  def editar_perfil
    @user = User.find(current_user.id)
  end

  def update_perfil
    @user = User.find(current_user.id)
    params[:user][:grupo_id] = current_user.grupo_id

    if @user.update_attributes(params[:user])
      redirect_to arearestrita_url, :notice  => "Os dados seu Perfil foram Atualizados com Sucesso."
    else
      render :action => 'editar_perfil'
    end
  end

  before_filter(:only => [:editar_senha, :update_senha]) do
     valida_permissao(7)
  end

  def editar_senha
    @user = User.find(current_user.id)
  end

  def update_senha
    @user = User.find(current_user.id)
    params[:user][:grupo_id] = current_user.grupo_id

    if @user.update_attributes(params[:user])
      redirect_to arearestrita_url, :notice  => "Os dados seu Perfil foram Atualizados com Sucesso."
    else
      render :action => 'editar_senha'
    end
  end

  before_filter(:only => [:editar_imagem, :update_imagem]) do
     valida_permissao(8)
  end

  def editar_imagem
    @user = User.find(current_user.id)
  end

  def update_imagem
    @user = User.find(current_user.id)
    params[:user][:grupo_id] = current_user.grupo_id

    if @user.update_attributes(params[:user])
      redirect_to arearestrita_url, :notice  => "A Imagem do Perfil foi Atualizada com Sucesso."
    else
      render :action => 'editar_imagem'
    end
  end

  before_filter(:only => [:index]) do
     valida_permissao(4)
  end

  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 10)
  end

  before_filter(:only => [:show]) do
     valida_permissao(5)
  end
  
  def show
    @user = User.find(params[:id])
  end

  before_filter(:only => [:destroy]) do
     valida_permissao(3)
  end

  def destroy
    redirect_to :back, :alert => "Função não habilitada"
  end

  private

  def resolve_layout
    #case action_name
    #when "salvar_cadastro"
    #  "sessions"
    #else
      "arearestrita"
    #end
  end

  protected

  def after_sign_up_path_for(resource)
    redirect_to(users_url)
  end

end
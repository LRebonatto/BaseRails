class FichasController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(58)
  end

  def index
    @fichas = Ficha.where(:deleted => 0).order("created_at DESC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(59)
  end

  def show
    @ficha = Ficha.find(params[:id])
  end
  
  def create
    #Faz validação recaptcha 
    return render_invalid_recaptcha if !correct_recaptcha?
    
    @ficha = Ficha.new(params[:ficha])
    if @ficha.save
      AvisoMailer.cadastro(@ficha).deliver
      redirect_to root_url, :notice => "Os dados foram enviados com sucesso. Em breve entraremos em contato contigo!"
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:edit, :update]) do
     valida_permissao(56)
  end

  def edit
    @ficha = Ficha.find(params[:id])
  end

  def update
    @ficha = Ficha.find(params[:id])
    if @ficha.update_attributes(params[:ficha])
      redirect_to @ficha, :notice  => "A Ficha foi atualizada com sucesso."
    else
      render :action => 'edit'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(57)
  end

  def destroy
    @ficha = Ficha.find(params[:id])
    @ficha.update_attributes(:deleted => 1)
    redirect_to fichas_url, :notice => "A Ficha foi apagada com sucesso."
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
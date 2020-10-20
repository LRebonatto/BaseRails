class NewslettersController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(48)
  end

  def index
    @newsletters = Newsletter.where(:deleted => 0).order("nome ASC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(49)
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end
  
  def create
    @newsletter = Newsletter.new(params[:newsletter])
    if @newsletter.save
      redirect_to root_url, :notice => "Seus dados forma adicionados a nossa Newsletter com sucesso."
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(50)
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.update_attributes(:deleted => 1)
    redirect_to newsletters_url, :notice => "O Contato da Newsletter foi apagado com sucesso."
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
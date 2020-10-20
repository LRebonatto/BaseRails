class AlunosController < ApplicationController
  before_filter :authenticate_user!
  layout :resolve_layout
  
  before_filter(:only => [:index]) do
     valida_permissao(41)
  end

  def index
    @alunos = Aluno.where(:deleted => 0).order("nome ASC").all
  end
  
  before_filter(:only => [:show]) do
     valida_permissao(42)
  end

  def show
    @aluno = Aluno.find(params[:id])
  end
  
  before_filter(:only => [:new, :create]) do
     valida_permissao(38)
  end

  def new
    @aluno = Aluno.new
  end

  def create
    @aluno = Aluno.new(params[:aluno])
    @aluno.user_id = current_user.id
    if @aluno.save
      redirect_to @aluno, :notice => "O Aluno foi adicionado com sucesso."
    else
      render :action => 'new'
    end
  end
  
  before_filter(:only => [:edit, :update]) do
     valida_permissao(39)
  end

  def edit
    @aluno = Aluno.find(params[:id])
  end

  def update
    @aluno = Aluno.find(params[:id])
    if @aluno.update_attributes(params[:aluno])
      redirect_to @aluno, :notice  => "O Aluno foi atualizado com sucesso."
    else
      render :action => 'edit'
    end
  end
  
  before_filter(:only => [:destroy]) do
     valida_permissao(40)
  end

  def destroy
    @aluno = Aluno.find(params[:id])
    @aluno.update_attributes(:deleted => 1)
    redirect_to alunos_url, :notice => "O Aluno foi apagado com sucesso."
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
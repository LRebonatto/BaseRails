class HomeController < ApplicationController

  def index
  end

  def noticias
    @noticias = Noticia.where(:deleted => 0, :status => 0).order("created_at DESC").all
  end

  def aniversariantes
    @alunos = Aluno.where("deleted = 0 AND status = 0 AND MONTH(data_nascimento) = #{Date.today.strftime("%m")}").order("DAY(data_nascimento) ASC").all
  end

  def outras_empresas
    @empresas = Empresa.where(:deleted => 0, :status => 0).order("nome ASC").all
  end

  def links_uteis
    @links = Link.where(:deleted => 0, :status => 0).order("posicao ASC, RAND()").all
  end

  def parceiros
    @parceiros = Parceiro.where(:deleted => 0, :status => 0).order("posicao ASC, RAND()").all
  end

  def galeria
    @galerias = Galeria.where(:deleted => 0, :status => 0).order("posicao ASC, RAND()").all
  end

  def depoimentos
    @depoimentos = Depoimento.where(:deleted => 0, :status => 0).order("created_at DESC").all
  end

  def bairros_atendidos
    @bairros = Bairro.where(:deleted => 0, :status => 0).order("created_at DESC").all
  end

  def instituicoes_de_ensino
    @instituicoes_categorias = InstituicaoCategoria.where(:deleted => 0, :status => 0).order("created_at DESC").all
  end

end
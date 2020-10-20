class ArearestritaController < ApplicationController
  before_filter :authenticate_user!, :except => [:get_cidades]

  def index
  end

  def get_cidades
    @cidades = Cidade.find(:all, :conditions => {:estado_id => params[:estado_id]})
  end
end
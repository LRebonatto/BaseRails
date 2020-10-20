Sistema::Application.routes.draw do
  resources :permissoes
  resources :grupos
  resources :grupo_permissoes
  resources :contatos
  resources :parceiros
  resources :galerias
  resources :noticias
  resources :links
  resources :alunos
  resources :empresas
  resources :newsletters
  resources :depoimentos
  resources :fichas
  resources :bairros
  resources :instituicoes
  resources :instituicao_categorias

  devise_for :users, :controllers => { :sessions => "users/sessions", :registrations => "users/registrations"}

  devise_scope :user do
    get '/login.2w' => 'users/sessions#new', :as => "login"
    get '/cadastro.2w' => 'users/registrations#new', :as => "cadastro"
    get '/users' => 'users/registrations#index', :as => "users"
    get '/user' => 'users/registrations#show', :as => "user"
    get '/user/editar/perfil' => 'users/registrations#editar_perfil', :as => "user_editar_perfil"
    put '/user/editar/perfil' => 'users/registrations#update_perfil', :as => "user_update_perfil"
    get '/user/editar/senha' => 'users/registrations#editar_senha', :as => "user_editar_senha"
    put '/user/editar/senha' => 'users/registrations#update_senha', :as => "user_update_senha"
    get '/user/editar/imagem' => 'users/registrations#editar_imagem', :as => "user_editar_imagem"
    put '/user/editar/imagem' => 'users/registrations#update_imagem', :as => "user_update_imagem"
  end

  root :to => "home#index"

  get "arearestrita", :to => 'arearestrita#index', :as => 'arearestrita'
  get "inicio/sobre-a-empresa", :to => 'home#sobre', :as => 'home_sobre'
  get "inicio/galeria", :to => 'home#galeria', :as => 'home_galeria'
  get "inicio/galeria/:galeria_id/:galeria_slug", :to => 'galerias#exibir', :as => 'exibir_galeria'
  get "inicio/imagens/exibir/:id", :to => 'galerias#exibir_imagem', :as => 'exibir_imagem'
  get "inicio/parceiros", :to => 'home#parceiros', :as => 'home_parceiros'
  get "inicio/parceiro/:parceiro_id/:parceiro_slug", :to => 'parceiros#exibir', :as => 'exibir_parceiro'
  get "inicio/noticias", :to => 'home#noticias', :as => 'home_noticias'
  get "inicio/noticia/:noticia_id/:noticia_slug", :to => 'noticias#exibir', :as => 'exibir_noticia'
  get "inicio/contato", :to => 'home#contato', :as => 'home_contato'
  get "inicio/parceiros", :to => 'home#parceiros', :as => 'home_parceiros'
  get "inicio/nossa-frota", :to => 'home#nossa_frota', :as => 'home_nossa_frota'
  get "inicio/bairros-atendidos", :to => 'home#bairros_atendidos', :as => 'home_bairros_atendidos'
  get "inicio/instituicoes-de-ensino", :to => 'home#instituicoes_de_ensino', :as => 'home_instituicoes_de_ensino'
  get "inicio/orientacoes", :to => 'home#orientacoes', :as => 'home_orientacoes'
  get "inicio/cadastro", :to => 'home#cadastro', :as => 'home_cadastro'
  get "inicio/links-uteis", :to => 'home#links_uteis', :as => 'home_links_uteis'
  get "inicio/aniversariantes", :to => 'home#aniversariantes', :as => 'home_aniversariantes'
  get "inicio/depoimentos", :to => 'home#depoimentos', :as => 'home_depoimentos'
  get "inicio/outras-empresas", :to => 'home#outras_empresas', :as => 'home_outras_empresas'
  get "inicio/localizacao", :to => 'home#localizacao', :as => 'home_localizacao'

  match "get_cidades", :to => 'arearestrita#get_cidades', :as => 'get_cidades'
  match "alterar/status/contato", :to => 'contatos#alterar_status', :as => 'alterar_status_contato'
end
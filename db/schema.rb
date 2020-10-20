# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20170222120655) do

  create_table "alunos", :force => true do |t|
    t.string   "nome",                           :null => false
    t.date     "data_nascimento",                :null => false
    t.integer  "user_id",                        :null => false
    t.integer  "status",          :default => 0, :null => false
    t.integer  "deleted",         :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bairros", :force => true do |t|
    t.string   "nome",                      :null => false
    t.integer  "status",     :default => 0, :null => false
    t.integer  "deleted",    :default => 0, :null => false
    t.integer  "user_id",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cidades", :force => true do |t|
    t.string  "nome",      :null => false
    t.integer "estado_id", :null => false
  end

  create_table "contatos", :force => true do |t|
    t.string   "nome",                      :null => false
    t.string   "telefone"
    t.string   "email",                     :null => false
    t.text     "mensagem",                  :null => false
    t.integer  "status",     :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "depoimentos", :force => true do |t|
    t.string   "nome",                      :null => false
    t.string   "descricao",                 :null => false
    t.integer  "user_id",                   :null => false
    t.integer  "status",     :default => 0, :null => false
    t.integer  "deleted",    :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empresas", :force => true do |t|
    t.string   "nome",                      :null => false
    t.string   "site",                      :null => false
    t.integer  "user_id",                   :null => false
    t.integer  "status",     :default => 0, :null => false
    t.integer  "deleted",    :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", :force => true do |t|
    t.string "nome",  :null => false
    t.string "sigla", :null => false
  end

  create_table "fichas", :force => true do |t|
    t.string   "nome",                                :null => false
    t.string   "idade"
    t.string   "nascimento",                          :null => false
    t.string   "endereco",                            :null => false
    t.string   "numero"
    t.string   "bairro",                              :null => false
    t.string   "referencia"
    t.string   "instituicao",                         :null => false
    t.string   "periodo",                             :null => false
    t.string   "serie"
    t.string   "turma"
    t.string   "sala"
    t.string   "professor"
    t.string   "responsavel"
    t.string   "nome_pai",                            :null => false
    t.string   "rg_pai"
    t.string   "cpf_pai"
    t.string   "data_nascimento_pai"
    t.string   "local_trabalho_pai"
    t.string   "fone_comercial_pai"
    t.string   "fone_residencial_pai"
    t.string   "celular_pai",                         :null => false
    t.string   "email_pai"
    t.string   "nome_mae"
    t.string   "rg_mae"
    t.string   "cpf_mae"
    t.string   "data_nascimento_mae"
    t.string   "local_trabalho_mae"
    t.string   "fone_comercial_mae"
    t.string   "fone_residencial_mae"
    t.string   "celular_mae"
    t.string   "email_mae"
    t.integer  "status",               :default => 0, :null => false
    t.integer  "deleted",              :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cep"
    t.string   "edificio"
    t.string   "bloco"
    t.string   "apto"
  end

  create_table "galerias", :force => true do |t|
    t.string   "nome",                      :null => false
    t.text     "descricao"
    t.string   "slug",                      :null => false
    t.integer  "posicao",    :default => 0, :null => false
    t.integer  "user_id",                   :null => false
    t.integer  "acessos",    :default => 0, :null => false
    t.integer  "status",     :default => 0, :null => false
    t.integer  "deleted",    :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "galerias", ["slug"], :name => "index_galerias_on_slug", :unique => true

  create_table "grupo_permissoes", :force => true do |t|
    t.integer "permissao_id", :null => false
    t.integer "grupo_id",     :null => false
  end

  create_table "grupos", :force => true do |t|
    t.string "descricao", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "galeria_id",                        :null => false
    t.integer  "capa",               :default => 0, :null => false
    t.integer  "deleted",            :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["galeria_id"], :name => "idx_1"

  create_table "instituicao_categorias", :force => true do |t|
    t.string   "nome",                      :null => false
    t.integer  "status",     :default => 0, :null => false
    t.integer  "deleted",    :default => 0, :null => false
    t.integer  "user_id",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instituicoes", :force => true do |t|
    t.string   "nome",                                    :null => false
    t.integer  "status",                   :default => 0, :null => false
    t.integer  "deleted",                  :default => 0, :null => false
    t.integer  "instituicao_categoria_id"
    t.integer  "user_id",                                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "nome",                      :null => false
    t.string   "site",                      :null => false
    t.integer  "posicao",    :default => 0, :null => false
    t.integer  "user_id",                   :null => false
    t.integer  "status",     :default => 0, :null => false
    t.integer  "deleted",    :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", :force => true do |t|
    t.string   "nome",                      :null => false
    t.string   "email",                     :null => false
    t.integer  "status",     :default => 0, :null => false
    t.integer  "deleted",    :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticias", :force => true do |t|
    t.string   "nome",                             :null => false
    t.text     "descricao",                        :null => false
    t.string   "slug",                             :null => false
    t.string   "capa_file_name",                   :null => false
    t.string   "capa_content_type"
    t.integer  "capa_file_size"
    t.datetime "capa_updated_at"
    t.integer  "posicao",           :default => 0, :null => false
    t.integer  "user_id",                          :null => false
    t.integer  "status",            :default => 0, :null => false
    t.integer  "deleted",           :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "noticias", ["slug"], :name => "index_noticias_on_slug", :unique => true

  create_table "parceiros", :force => true do |t|
    t.string   "nome",                             :null => false
    t.string   "site",                             :null => false
    t.string   "capa_file_name",                   :null => false
    t.string   "capa_content_type"
    t.integer  "capa_file_size"
    t.datetime "capa_updated_at"
    t.integer  "posicao",           :default => 0, :null => false
    t.integer  "user_id",                          :null => false
    t.integer  "status",            :default => 0, :null => false
    t.integer  "deleted",           :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissoes", :force => true do |t|
    t.string "descricao", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                     :default => "", :null => false
    t.string   "encrypted_password",         :limit => 128, :default => "", :null => false
    t.integer  "sign_in_count",                             :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reset_password_token"
    t.integer  "administrador",                             :default => 0
    t.string   "nome_completo",                                             :null => false
    t.integer  "grupo_id",                                  :default => 0,  :null => false
    t.string   "imagem_perfil_file_name"
    t.string   "imagem_perfil_content_type"
    t.integer  "imagem_perfil_file_size"
    t.datetime "imagem_perfil_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end

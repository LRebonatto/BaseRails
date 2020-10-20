# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
   inflect.plural 'permissao', 'permissoes'
   inflect.plural 'grupo', 'grupos'
   inflect.plural 'grupo_permissao', 'grupo_permissoes'
   inflect.plural 'grupo_user', 'grupo_users'
   inflect.plural 'parceiro', 'parceiros'
   inflect.plural 'galeria', 'galerias'
   inflect.plural 'noticia', 'noticias'
   inflect.plural 'aluno', 'alunos'
   inflect.plural 'empresa', 'empresas'
   inflect.plural 'depoimento', 'depoimentos'
   inflect.plural 'ficha', 'fichas'
   inflect.plural 'bairro', 'bairros'
   inflect.plural 'instituicao', 'instituicoes'
   inflect.plural 'instituicao_categoria', 'instituicao_categorias'
   inflect.singular 'permissoes', 'permissao'
   inflect.singular 'grupos', 'grupo'
   inflect.singular 'grupo_permissoes', 'grupo_permissao'
   inflect.singular 'grupo_users', 'grupo_user'
   inflect.singular 'parceiros', 'parceiro'
   inflect.singular 'galerias', 'galeria'
   inflect.singular 'noticias', 'noticia'
   inflect.singular 'alunos', 'aluno'
   inflect.singular 'empresas', 'empresa'
   inflect.singular 'depoimentos', 'depoimento'
   inflect.singular 'fichas', 'ficha'
   inflect.singular 'bairros', 'bairro'
   inflect.singular 'instituicoes', 'instituicao'
   inflect.singular 'instituicao_categorias', 'instituicao_categoria'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
end
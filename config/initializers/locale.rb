# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
I18n.default_locale = 'pt-BR'
I18n.locale         = 'pt-BR'

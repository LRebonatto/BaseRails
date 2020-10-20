ActionMailer::Base.smtp_settings = {
  :address              => "smtp.sparkpostmail.com",
  :port                 => "587",
  :domain               => "www.transportesanacar.com.br",
  :user_name            => "SMTP_Injection",
  :password             => "470bec9ead94b827baa8c14a2c260525c2b73e06",
  :authentication       => :plain,
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_url_options[:host] = "transportesanacar.com.br"
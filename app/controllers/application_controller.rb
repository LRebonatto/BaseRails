require 'net/http'
require 'net/https'
require 'uri'

class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery

  # Start - Recaptcha
	def request_recaptcha
		parameters = {'secret' => "6LcVMN0UAAAAADCbR_3i1UJvBMnmUrGRtZZ56cH1", 'response' => params['g-recaptcha-response']}
		uri = URI.parse('https://www.google.com/recaptcha/api/siteverify')

		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true

		# Header
		request = Net::HTTP::Post.new(uri.request_uri, {'Content-Type' => 'application/x-www-form-urlencoded'})
		# Body/Params
		request.set_form_data(parameters)

		# Faz a Requisição para o Google
		response = http.request(request)

		json = JSON.parse(response.try(:body))
		json['success']
	end

	def render_invalid_recaptcha
		redirect_to :back, :notice => "Recaptcha falhou." 
	end

	def correct_recaptcha?
		recaptcha = nil
		# Se tem o parametro faz a requisição
		if params['g-recaptcha-response'].present?
			recaptcha = request_recaptcha
			# Se falhar a validacao mostra a msg erro
			if recaptcha.to_s != 'true'
				return false
			end
		else
			return false
		end
		return recaptcha.to_s == 'true'
	end
	# End - Recaptcha

end
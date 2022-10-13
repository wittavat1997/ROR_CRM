# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

3.0.1 :007 > Rails.application.credentials[Rails.env.to_sym][:github][:id]
3.0.1 :001 > Rails.env
 => "development" 
3.0.1 :002 > Rails.env.to_sym
 => :development 
3.0.1 :008 > Rails.application.credentials.dig(:google_oauth2)

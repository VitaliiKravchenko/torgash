OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1273788652641037', '93869808fac118c72dbf67ee5f9f5fd7', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end

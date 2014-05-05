
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, Rails.application.secrets.linkedin_key, Rails.application.secrets.linkedin_secret
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# frozen_string_literal: true

if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_devote_frontend', domain: '_devote_backend'
else
  Rails.application.config.session_store :cookie_store, key: '_devote_frontend'
end

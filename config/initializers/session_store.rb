# Be sure to restart your server when you modify this file.

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
Chatapp::Application.config.session_store ActionDispatch::Session::CacheStore, :namespace => 'sessions', :key => '_gc_session', :expire_after => 2.days

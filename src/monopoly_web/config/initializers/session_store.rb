# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_monopoly_web_session',
  :secret      => '0f7c60e59c94a3ea4cb6d5d46233606e116f0f9be4720b352cbcc23416eb1d7eed03a439e824b04ec4a4e8e1ea6b8b6d2ea86560e57e131836db0d58a781931d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

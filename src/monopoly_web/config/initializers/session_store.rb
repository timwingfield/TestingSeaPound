# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_monopoly_web_session',
  :secret      => 'bb4b0e566823fc3ef343ac06cbfca8f96c357dfff35b5f148a69146ad2c938ad63c7565a7a73719b5c5ac5bc3a138ed6b3c3529bbbffbe69c03fb7b832b79dad'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_railsenv_session',
  :secret      => '5b6ce90fd6469cb00f7486f06c61280817a3fde17955abe87a4ae1f02547c6f65d54a1a04e843e0bf4f1694935aa95bddf2f57ce886ffb395a89a3af01d07b4a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

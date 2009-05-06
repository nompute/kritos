# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kritos_session',
  :secret      => '2735b98467e65aeb177b5e10234ca6742185525b70f80f2ae0c5ec2ebe547b75fd6eedf26067fa095f898732ba62b9e0b2aff1cd05c989aeedd832395dfe2651'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

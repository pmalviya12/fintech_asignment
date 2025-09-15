# README
This README would normally document whatever steps are necessary to get the
application up and running.

# 1. Clone the repo
git clone (https://github.com/pmalviya12/fintech_asignment)
cd FinTech

# 2. Install Gem
bundle install

# 3. Set up database
rails db:create db:migrate db:seed

# 4. Start Server
rails server
-----------------------------------------------------------------------

Feedback changes:

Removed sqlite3 gem from the project.
Added pg gem in the Gemfile.
Updated config/database.yml to use PostgreSQL for all environments.
Verified via Rails console

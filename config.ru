require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# we need the following line so we can send PATCH and DELETE requests
use Rack::MethodOverride

# this is where we mount all of our controllers with `use`
use UsersController
use SnippetsController
run ApplicationController

# Reload the browser automatically whenever files change
activate :livereload
activate :dotenv

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :directory_indexes

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Build-specific configuration
configure :build do
  set :http_prefix, '/'
end

Fog.credentials = { path_style: true }

activate :sync do |sync|
  sync.fog_provider = 'AWS'
  sync.fog_directory = ENV['DEPLOY_BUCKET']
  sync.fog_region = 'us-west-2'
  sync.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  sync.existing_remote_files = 'ignore'
  sync.after_build = false
end

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  activate :gzip

  activate :asset_hash

  activate :minify_css
  activate :minify_javascript

  set :http_prefix, '/'
end

Fog.credentials = { path_style: true }

# activate :sync do |sync|
#   sync.fog_provider = 'AWS'
#   sync.fog_directory = ENV['DEPLOY_BUCKET']
#   sync.fog_region = 'us-west-2'
#   sync.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
#   sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
#   sync.existing_remote_files = 'keep'
#   sync.gzip_compression = true
#   sync.after_build = true
# end
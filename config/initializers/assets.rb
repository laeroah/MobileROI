# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

page_js = Dir[File.join(Rails.root, 'app/assets/javascripts/*')].map do |file|
  File.basename(file, '.*') + '.js'
end

page_css = Dir[File.join(Rails.root, 'app/assets/stylesheets/*')].map do |file|
  File.basename(file, '.*') + '.css'
end

Rails.application.config.assets.precompile += page_js + page_css

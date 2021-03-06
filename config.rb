###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
page '/posts/*', layout: :post
page 'blog.html', layout: :posts
page 'tag/*', layout: :posts
page '/feed.xml', layout: false

#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Pretty URLs
activate :directory_indexes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

set :haml, format: :html5

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Deployment
activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  deploy.remote = 'git@github.com:lab2023/lab2023.com.git'
  deploy.branch = 'gh-pages'
end

# Blog
activate :blog do |blog|
  blog.sources = 'posts/{year}-{month}-{day}-{title}'
  blog.default_extension = '.md'
  blog.permalink = '{title}'
  blog.taglink = 'tag/{tag}.html'
  blog.tag_template = 'tag.html'
  blog.summary_separator = /READMORE/
end

activate :syntax
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true
set :haml, { ugly: true }

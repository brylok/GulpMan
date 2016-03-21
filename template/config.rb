# ========================================================================
# GulpMan
# http://brylok.com/gulpman
# ========================================================================

# Include Environment Variables
require "./data/environment_variables.rb"


# ========================================================================
# Site settings
# ========================================================================
set :site_url, ENV['site_url_production']
set :site_google_analytics_key, ""  #only set on builds


###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

config[:images_dir] = 'images/'

activate :external_pipeline,
  name: :gulp,
  command: build? ? 'gulp buildProd' : 'gulp default',
  source: ".tmp/dist"

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do

  # "Ignore" JS so gulp has more control.
  ignore 'javascripts/vendor/*'
  ignore 'javascripts/vendor.js'

  # cache buster asset hashing
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Auto prefix css with browser specific classes
  activate :autoprefixer

  # Minify the html, css, js
  activate :minify_css
  # activate :minify_javascript
  activate :minify_html

  # gzip it all
  # activate :gzip

  # Create favicon and device-specific icons
  # temporarily removed
  # activate :favicon_maker, :icons => {
  #                            "favicon-template.png" => [
  #                                { icon: "images/apple-touch-icon-180x180-precomposed.png" },        # Same as apple-touch-icon-57x57.png, for retina iPad with iOS7.
  #                                { icon: "images/apple-touch-icon-152x152-precomposed.png" },        # Same as apple-touch-icon-57x57.png, for retina iPad with iOS7.
  #                                { icon: "images/apple-touch-icon-144x144-precomposed.png" },        # Same as apple-touch-icon-57x57.png, for retina iPad with iOS6 or prior.
  #                                { icon: "images/apple-touch-icon-120x120-precomposed.png" },        # Same as apple-touch-icon-57x57.png, for retina iPhone with iOS7.
  #                                { icon: "images/apple-touch-icon-114x114-precomposed.png" },        # Same as apple-touch-icon-57x57.png, for retina iPhone with iOS6 or prior.
  #                                { icon: "images/apple-touch-icon-76x76-precomposed.png" },          # Same as apple-touch-icon-57x57.png, for non-retina iPad with iOS7.
  #                                { icon: "images/apple-touch-icon-72x72-precomposed.png" },          # Same as apple-touch-icon-57x57.png, for non-retina iPad with iOS6 or prior.
  #                                { icon: "images/apple-touch-icon-60x60-precomposed.png" },          # Same as apple-touch-icon-57x57.png, for non-retina iPhone with iOS7.
  #                                { icon: "images/apple-touch-icon-57x57-precomposed.png" },          # iPhone and iPad users can turn web pages into icons on their home screen. Such link appears as a regular iOS native application. When this happens, the device looks for a specific picture. The 57x57 resolution is convenient for non-retina iPhone with iOS6 or prior. Learn more in Apple docs.
  #                                { icon: "images/apple-touch-icon-precomposed.png", size: "57x57" }, # Same as apple-touch-icon.png, expect that is already have rounded corners (but neither drop shadow nor gloss effect).
  #                                { icon: "images/apple-touch-icon.png", size: "57x57" },             # Same as apple-touch-icon-57x57.png, for "default" requests, as some devices may look for this specific file. This picture may save some 404 errors in your HTTP logs. See Apple docs
  #                                { icon: "images/favicon-196x196.png" },                             # For Android Chrome M31+.
  #                                { icon: "images/favicon-160x160.png" },                             # For Opera Speed Dial (up to Opera 12; this icon is deprecated starting from Opera 15), although the optimal icon is not square but rather 256x160. If Opera is a major platform for you, you should create this icon yourself.
  #                                { icon: "images/favicon-96x96.png" },                               # For Google TV.
  #                                { icon: "images/favicon-32x32.png" },                               # For Safari on Mac OS.
  #                                { icon: "images/favicon-16x16.png" },                               # The classic favicon, displayed in the tabs.
  #                                { icon: "images/favicon.png", size: "16x16" },                      # The classic favicon, displayed in the tabs.
  #                                { icon: "images/favicon.ico", size: "64x64,32x32,24x24,16x16" },    # Used by IE, and also by some other browsers if we are not careful.
  #                                { icon: "images/mstile-70x70.png", size: "70x70" },                 # For Windows 8 / IE11.
  #                                { icon: "images/mstile-144x144.png", size: "144x144" },
  #                                { icon: "images/mstile-150x150.png", size: "150x150" },
  #                                { icon: "images/mstile-310x310.png", size: "310x310" },
  #                                { icon: "images/mstile-310x150.png", size: "310x150" }
  #                            ]
  #                        }

  # only set google analytics id on prod
  set :site_google_analytics_key, ENV['site_google_analytics_key']
end

# Copy this file to environment_variables.rb, then update these settings

# setup s3 options
ENV['build_folder'] = "build/"
ENV['s3_profile'] = "default"
ENV['s3_permissions'] = "public-read"

# URL when developing locally
ENV['site_url_development'] = "http://0.0.0.0:4567"

# URL when building for deployment to staging
ENV['site_url_staging'] = "http://someaddress.com/staging"
ENV['site_bucket_staging'] = "someaddress.com/staging"

# URL when building for deployment to production
ENV['site_url_production'] = "http://someaddress.com/production"
ENV['site_bucket_production'] = "someaddress.com/production"

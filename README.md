# GulpMan

A Middleman 4 project template. Using the following open source tools:

- SCSS
- Autoprefixer
- Gulp (for JS module bundling, image minification and css cleanup)
- Aws-cli for S3 deployment

## Create new project

`middleman init -T brylok/gulpman`


## Rake Commands

Preview your project in the browser with autoreload: `rake preview`


Build Your Project to a Local Folder: `rake build`


Deploy Your Project to Staging: `rake deploy:staging`

Deploy Your Project to Production: `rake deploy:production`


## Deployment Setup
Deployment is handled using the AWS CLI.


#### Install aws-cli
To install the AWS CLI you must:

Install pip: `sudo apt-get install python-pip`

Install aws-cli: `sudo pip install awscli`


#### Modify Environmental Variables
You now need to edit your projects environmental variables in the data/environment_variables.rb file:

This is where you will set the following information:

build folder, s3 profile, s3 permissions, site url (local, staging, prod), s3 bucket (staging, prod)



## Troubleshooting

If you run into trouble, make sure you have middleman CLI installed globally:

`gem install middleman`

Also, be sure to have Ruby ^2.2.2

If you have trouble with the uncss task you might need to install PhantomJS manually:

`brew install phantomjs`


You may also need to install gems and node packages

`bundle install; npm install`

# User Tracking

This is a small service that receives
requests from clients that are using tracker.js lib.

Unique page hits are being mapped into Request, and when someone register
their email and name, it will become a Lead.

# Application Requirements

* Rails 5.2
* Ruby 2.4.6
* Redis configured in default port (6379)

# Prepare application

Install gems

`bundle install`

Create database

`rake db:create db:migrate`

# How To Execute

This application is using foreman as default to launch everything you might need.
Edit Procfile or use commands individually if you want.

run: 
`foreman start -f Procfile.env`

Notes: 
* if you have Redis already running, remove it from Procfile
* if you change default port, remember to change it in tracker.js ENDPOINT, this is only for localhost testing.


client:
Open index.html located in the root folder, this is a simple page just to simulate that the script works anywhere.

reports: You can see requests and page hits by running rails server and accessing /requests route.

tests: `bundle exec rspec spec`


IMPORTANT: In order to test this application from a client in localhost
it is necessary to install Google Chrome/Firefox CORS extension, or add CORS to request Header to prevent further security errors.


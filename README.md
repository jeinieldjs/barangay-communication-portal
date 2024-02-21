# Barangay Communications Platform

This is a rails app that aims to facilitate communication between local government units, and its residents. It makes use of the [Philippine Standard Geographical Code API](https://psgc.gitlab.io/api/) to group users based on the barangay they reside in.


## Dependencies


```ruby
ruby "3.2.0"
gem "rails", "~> 7.1.3"
gem 'pg'
gem 'devise'
gem 'rspec-rails', '~> 6.1'
gem 'shoulda-matchers'
gem 'rest-client'

```

## Admin functions
* Create resident accounts for unregistered users
* Approve or reject resident registrations
* Update residents' information
* Create announcements for residents
* Receive and evaluate complaints from residents
* Monitor and moderate posts from residents

## Resident functions
* Create their own accounts
* Receive announcements
* File complaints/reports
* Communicate with other users from the same barangay through posts
* Create comments and likes on posts



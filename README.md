# README

easiest way to get postgres running on mac:
http://postgresapp.com/

Make sure to 'bundle install' and before that install postgres
To create database, type:
- "sudo -i -u postgres"
- type "psql" to access postgres

to create postgres user (don't forget the semicolon ; ):
- "CREATE USER nuri_dev;"

to create database:
- "CREATE DATABASE nuri_dev WITH OWNER nuri_dev;"

- type "/q" after done to exit psql and "exit" to return to normal console

- run "rake db:migrate db:seed"

- "rails s" to start rails server

# accounts
- use "email@example.com" with password: "password" for normal user
- use "admin@example.com" with password: "password" for admin user

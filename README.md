# OneCarBrakePads
A mini Ruby on Rails project following the instructions in the Assignment.pdf :)
 == IN PROGRESS ==


Step-by-Step to create this project
-----------------------------------
Notice: When my line begins with '>', it's a terminal command

1. Install rails version 4.1.12
> gem install rails -v 4.1.12

2. Create rails project with postgresql database
> rails _4.1.12_ new my_car_parts -d postgresql

3. Include gems bootstrap-sass, simple_form, devise
Go to Gemfile and add the following lines:
# Use boostrap CSS framework. Read more: https://rubygems.org/gems/bootstrap-sass/versions/3.3.5.1
gem 'bootstrap-sass', '~> 3.3.5.1'
# simple_form - Improved from generator. Read more: https://rubygems.org/gems/simple_form/versions/3.1.0
gem 'simple_form', '~> 3.1.0'
# Use devise for User authentication. Read more: https://rubygems.org/gems/devise/versions/3.5.2
gem 'devise', '~> 3.5.2'
Update bundle as follows:
> bundle install

* This gave me compatibilities issues, so I updated the version of sass-rails to the latest one
gem 'sass-rails', '~> 5.0.3'

> bundle install
> Your bundle is complete!

4. Set up postgress user
I followed this: https://stackoverflow.com/questions/19953653/how-to-set-up-postgres-database-for-local-rails-project/20305467#20305467
> sudo su postgres -c psql
> create user marsty5 with password 'password'; # create user "marsty5" with password "password"
> alter user marsty5 superuser;
> create database my_car_parts_development;
> create database my_car_parts_test;  
> grant all privileges on database my_car_parts_development to marsty5;
> grant all privileges on database my_car_parts_test to marsty5;
> \q

5. Update config/database.yml
Under default: &default, add the following lines
username: marsty5
password: password
host: localhost
port: 5432

6. Run rails server and check localhost
> bin/rails server
Go to browser and type http://localhost:3000/

* Initially, I skipped step 5 and when I tried to enter localhost, I was getting the error "fe_sendauth no password supplied"

7. Create the welcome controller which handles the welcome page
> bin/rails generate controller welcome index
This prints the following information:
create  app/controllers/welcome_controller.rb
      route  get 'welcome/index'
      invoke  erb
      create    app/views/welcome
      create    app/views/welcome/index.html.erb
      invoke  test_unit
      create    test/controllers/welcome_controller_test.rb
      invoke  helper
      create    app/helpers/welcome_helper.rb
      invoke    test_unit
      create      test/helpers/welcome_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/welcome.js.coffee
      invoke    scss
      create      app/assets/stylesheets/welcome.scss

8. Make the welcome page the root page of your website.
Go to config/routes.rb and uncomment the line root 'welcome#index'
Now open the page: http://localhost:3000/
This site also works: http://localhost:3000/welcome/index

9. Create a resource car_model (not needed for this assignment)
Go to config/routes.rb and add the following line
resources :car_models

Run the following:
> bin/rake routs
The following is printed:
 Prefix Verb   URI Pattern                    Controller#Action
 welcome_index GET    /welcome/index(.:format)       welcome#index
          root GET    /                              welcome#index
    car_models GET    /car_models(.:format)          car_models#index
               POST   /car_models(.:format)          car_models#create
 new_car_model GET    /car_models/new(.:format)      car_models#new
edit_car_model GET    /car_models/:id/edit(.:format) car_models#edit
     car_model GET    /car_models/:id(.:format)      car_models#show
               PATCH  /car_models/:id(.:format)      car_models#update
               PUT    /car_models/:id(.:format)      car_models#update
               DELETE /car_models/:id(.:format)      car_models#destroy

10. Create model User using Devise for authentication
> rails generate devise user        # Create model class, routes, etc.
> rake db:migrate                   # Create user table

11. Create models CarModel, PartType, Order, OrderPart
> rails generate model CarModel name:string
> rake db:migrate
> rails generate model PartType name:string partno:integer manufacturer:string price:float
> rake db:migrate
> rails generate model Order user:references address:string total:float
> rake db:migrate
> rails generate model OrderType parttype:reference order:references price:float
> rake db:migrate

12. Add two pictures in the app/assets/images for the car model and part type

13.

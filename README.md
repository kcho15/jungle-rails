# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. 

The goal of the project was to learn how to fix bugs in an unfamiliar language and framework, as well as make and test new features. 

## Screenshots

![1](https://github.com/kcho15/jungle-rails/blob/master/app/assets/images/jungle-home.PNG)

![2](https://github.com/kcho15/jungle-rails/blob/master/app/assets/images/jungle-cart.PNG)

![3](https://github.com/kcho15/jungle-rails/blob/master/app/assets/images/jungle-products.PNG)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Unit and feature testing has been added to make sure the site is functioning as intended.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Screenshots

!["Screenshot of the products page which shows all products."](https://github.com/kguertin/jungle/blob/master/docs/jungle-products-page.png?raw=true)
!["The product description page, which shows information of a specific product."](https://github.com/kguertin/jungle/blob/master/docs/jungle-product-description.png?raw=true)
!["The users cart  after it had products added to it."](https://github.com/kguertin/jungle/blob/master/docs/jungle-cart.png?raw=true)

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios. Any future date can be used for expiry and any three numbers for the CVV code.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

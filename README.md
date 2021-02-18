# Eventful React/Rails project

## Day 1

[Devise JWT Tutorial](https://github.com/dakotalmartinez/rails-devise-jwt-tutorial) up to and including the Create User Model section.

Uncomment rack-cors in gemfile

copy this into cors.rb config

```rb
# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource(
     '*',
     headers: :any,
     expose: ["Authorization"],
     methods: [:get, :patch, :put, :delete, :post, :options, :show]
    )
  end
end
```

Add to Gemfile:
```rb
gem 'devise'
gem 'devise-jwt'
gem 'jsonapi-serializer'
```

[JSON API Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)

Run 
```bash
bundle install
```

Configure devise

```bash
rails g devise:install
```

Find this line in devise.rb initializer:
 
```
# config.navigational_formats = ['*/*', :html]
```
and replace it with this:

```rb
config.navigational_formats = []
```


Also, add the following line to config/environments/development.rb

```rb
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

## Create a Devise User

You can create a devise model to represent a user. It can be named as anything. So, I’m gonna be going ahead with User. Run the following command to create User model.

$ rails generate devise User
Then run migrations using,

$ rails db:create
$ rails db:migrate

## Adding Groups

```bash
rails g scaffold Group name
```

For our app, we don't need update and destroy for groups so we'll remove the udpate and destroy actions from the GroupsController and update the routes.rb file like so:

```rb
resources :groups, except: [:update, :destroy]
```

WE can test out our routes by running 

```bash
rails routes | grep groups
```

We get something like this: 

```bash
 groups GET    /groups(.:format)          groups#index
        POST   /groups(.:format)          groups#create
  group GET    /groups/:id(.:format)      groups#show
```

We can run the migration to add the table 

```bash
rails db:migrate
```


## Resources

- [Postico](https://eggerapps.at/postico/)
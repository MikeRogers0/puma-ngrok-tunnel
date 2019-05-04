# puma-ngrok-tunnel

A plugin for puma that'll start a ngrok tunnel to your rails server. Built to make it easier to build apps that require webhooks to work as expected.


## Installation

Make sure you have installed ngrok on your machine:

    $ brew install ngrok

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'puma-ngrok-tunnel'
end
```

And then execute:

    $ bundle

Lastly in your `config/puma.rb` file, append the line:


```ruby
plugin :ngrok_tunnel if ENV['NGROK_TUNNEL_ENABLED']
```

## Installation with puma-dev

Add the environmental variable (in a .env file for example):

```
CONFIG=config/puma.rb
```

## Usage

Read about how to configure puma to use this plugin here: https://github.com/puma/puma#plugins

There are a few variables this plugin reads from the environment which control its behavior.

* `TODO`


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


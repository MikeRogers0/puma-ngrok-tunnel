# puma-ngrok-tunnel

[![Gem Version](https://badge.fury.io/rb/puma-ngrok-tunnel.svg)](https://badge.fury.io/rb/puma-ngrok-tunnel)

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

There are a few variables this plugin reads from the environment which control its behavior. These are based on the arguments you'd pass to the [ngrok terminal command](https://ngrok.com/docs#http-subdomain).

* `PORT` - defaults to 3000
* `NGROK_ADDR`
* `NGROK_AUTHTOKEN`
* `NGROK_HOST_HEADER`
* `NGROK_CONFIG`
* `NGROK_SUBDOMAIN`
* `NGROK_REGION`
* `NGROK_HOSTNAME` - Full ngrok hostname, shouldn't be set if `NGROK_SUBDOMAIN` is set.

### Sample .env

```
# Puma-dev: You need to define this otherwise it uses it's own puma.rb file.
CONFIG=config/puma.rb

# puma-ngrok-tunnel setup
# These should start with 'export' otherwise puma-dev won't use them.
export NGROK_TUNNEL_ENABLED=true
export NGROK_SUBDOMAIN=my-app-name
export NGROK_REGION=eu
# The URL (and HTTPS Port) you might use to access this under Puma-dev
export NGROK_ADDR=my-app-name.test:443
export NGROK_HOST_HEADER=my-app-name.test
```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


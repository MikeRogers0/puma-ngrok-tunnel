# puma-ngrok-tunnel

[![Gem Version](https://badge.fury.io/rb/puma-ngrok-tunnel.svg)](https://badge.fury.io/rb/puma-ngrok-tunnel)

A plugin for puma that'll start a [ngrok tunnel](https://ngrok.com/) to your rails server when puma starts. Primary I built this to make the following a little easier:

* Working with apps that require Webhooks to be received by the app to work correctly
* Demoing your local rails app to someone else without have to share IPs
* Working with [Puma-dev](https://github.com/puma/puma-dev/) so your apps feels as production-like as possible.

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

## Usage

Read about how to configure puma to use this plugin here: https://github.com/puma/puma#plugins

There are a few variables this plugin reads from the environment which control its behavior. These are based on the arguments you'd pass to the [ngrok terminal command](https://ngrok.com/docs#http-subdomain).

* `PORT` - Optional, your rails port, defaults to `3000`. If `NGROK_ADDR` is set, this is ignored.
* `NGROK_ADDR` - Optional, if you're using Puma-dev set this to be your hostname & port, e.g. `my-app-name.test:443`.
* `NGROK_AUTHTOKEN` - Optional, your ngrok authtoken. If you have ngrok configured on your local machine you don't need this.
* `NGROK_HOST_HEADER` - Optional, if you're using Puma-dev you should set this to your virtual host e.g. `my-app-name.test`.
* `NGROK_CONFIG` - Optional, your ngrok configuration file location, defaults to `~/.ngrok2/ngrok.yml`.
* `NGROK_SUBDOMAIN` - Optional, ngrok will assign you a random subdomain unless this is set.
* `NGROK_REGION` - Optional, the region of your ngrok tunnel. defaults to `us`.
* `NGROK_HOSTNAME` - Optional, full ngrok hostname, shouldn't be set if `NGROK_SUBDOMAIN` is set.

### Sample .env for use with `rails s`

```
# puma-ngrok-tunnel setup
# You need https://github.com/bkeepers/dotenv setup to make sure Puma can use these.
export NGROK_TUNNEL_ENABLED=true
export NGROK_SUBDOMAIN=my-app-name
export NGROK_REGION=eu
```

### Sample .env for use with Puma-dev

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


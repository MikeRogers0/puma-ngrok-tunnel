<h1 align="center">
  puma-ngrok-tunnel
</h1>

<p align="center">
  <a target="_blank" rel="noopener noreferrer" href="https://twitter.com/MikeRogers0">
    <img src="https://img.shields.io/twitter/follow/MikeRogers0?label=Follow%20%40MikeRogers0%20For%20Updates&style=social" alt="Follow @MikeRogers on Twitter" style="max-width:100%;">
  </a>
  <a target="_blank" rel="noopener noreferrer" href="https://badge.fury.io/rb/puma-ngrok-tunnel">
    <img src="https://badge.fury.io/rb/puma-ngrok-tunnel.svg" alt="Gem Version" style="max-width:100%;">
  </a>
  <a target="_blank" rel="noopener noreferrer" href="https://github.com/MikeRogers0/puma-ngrok-tunnel/workflows/Testing/badge.svg">
    <img src="https://github.com/MikeRogers0/puma-ngrok-tunnel/workflows/Testing/badge.svg" alt="Tests Passing" style="max-width:100%;">
  </a>
  <a target="_blank" rel="noopener noreferrer" href="https://github.com/MikeRogers0/puma-ngrok-tunnel/workflows/RuboCop/badge.svg">
    <img src="https://github.com/MikeRogers0/puma-ngrok-tunnel/workflows/RuboCop/badge.svg" alt="RuboCop Standards" style="max-width:100%;">
  </a>
</p>


<p align="center">
A plugin for puma that'll start a <a href="https://ngrok.com/">ngrok tunnel</a> to your rails server when puma starts. Primary I built this to make the following a easier:
</p>

# Deprecation Notice

This gem is not longer actively maintained, I suggest using theses alternatives instead:

- [Overmind](https://github.com/DarthSim/overmind) or [Foreman](https://github.com/ddollar/foreman)
- [Docker ngrok](https://hub.docker.com/r/wernight/ngrok/)

# What it does

![image](https://user-images.githubusercontent.com/325384/57193363-1d2c4800-6f32-11e9-82a4-1efc54fac0ad.png)

  * Working with apps that require Webhooks to be received by the app to work correctly
  * Demoing your local rails app to someone else
  * Working with [Puma-dev](https://github.com/puma/puma-dev/) so your apps feels as production-like as possible
  * Testing on mobile.

I've setup a [sample Rails 6 app](https://github.com/MikeRogers0-YouTube/puma-ngrok-tunnel-SampleRails6App) which demos an implementation of this gem.

## Installation

### Adding ngrok package to your machine

Make sure you have installed ngrok on your machine:

```bash
$ brew tap caskroom/cask
$ brew cask install ngrok
```

### Adding the gem

I've automated these steps into an `app:template` which can be found on [Rails Bytes](https://railsbytes.com/templates/xkjseg). However, if you'd like to install it manually follow these steps:

1. Add this line to your application's `Gemfile`:

```ruby
group :development do
  gem 'puma-ngrok-tunnel'
end
```

2. And then execute:

```bash
$ bundle
```

3. Append this line to your `config/puma.rb` file:

```ruby
plugin :ngrok_tunnel if ENV.fetch('RAILS_ENV') { 'development' } == 'development'
```

4. Lastly, update your `config/environments/development.rb` to include the line:

```ruby
# puma-ngrok-tunnel: Allow connections from ngrok
config.hosts << /[a-z0-9.]+.ngrok.io/
```

## Usage

Read about how to configure puma to use this in [the Puma documentation](https://github.com/puma/puma#plugins).

There are a few variables this plugin reads from the environment which control its behavior. These are based on the arguments you'd pass to the [ngrok terminal command](https://ngrok.com/docs#http-subdomain).

  * `PORT` - Optional, your rails port, defaults to `3000`. If `NGROK_ADDR` is set, this is ignored.
  * `NGROK_ADDR` - Optional, if you're using Puma-dev set this to be your hostname & port, e.g. `my-app-name.test:443`.
  * `NGROK_AUTHTOKEN` - Optional, your ngrok authtoken. If you have ngrok configured on your local machine you don't need this.
  * `NGROK_HOST_HEADER` - Optional, if you're using Puma-dev you should set this to your virtual host e.g. `my-app-name.test`.
  * `NGROK_CONFIG` - Optional, your ngrok configuration file location, defaults to `~/.ngrok2/ngrok.yml`.
  * `NGROK_SUBDOMAIN` - Optional, ngrok will assign you a random subdomain unless this is set.
  * `NGROK_REGION` - Optional, the region of your ngrok tunnel. The default is `us`.
  * `NGROK_HOSTNAME` - Optional, full ngrok hostname, shouldn't be set if `NGROK_SUBDOMAIN` is set.

### Sample .env for use with `rails s`

```bash
# puma-ngrok-tunnel setup
# You need https://github.com/bkeepers/dotenv setup to make sure Puma can use these.
export NGROK_TUNNEL_ENABLED=true
export NGROK_SUBDOMAIN=my-app-name
export NGROK_REGION=eu
```

### Sample .env for use with Puma-dev

```bash
# Puma-dev: You need to define this otherwise it uses it's own puma.rb file.
CONFIG=config/puma.rb

# puma-ngrok-tunnel setup
# These should start with 'export' otherwise puma-dev won't use them.
export NGROK_SUBDOMAIN=my-app-name
export NGROK_REGION=eu
# The URL (and HTTPS Port) you might use to access this under Puma-dev
export NGROK_ADDR=my-app-name.test:443
export NGROK_HOST_HEADER=my-app-name.test
```

## Pitfalls & solutions

### The ngrok tunnel not always stopping when puma-dev stops

If you see an error saying `http: proxy error: dial unix`, it means ngrok was able to stop when puma was stopped. Right now the solution is to run:

```bash
pkill ngrok
```

in your terminal.

### Rails 6 "Blocked host" error

If you seeing an error like:

> Blocked host: a620ba29.ngrok.io
>
> To allow requests to a620ba29.ngrok.io, add the following to your environment configuration:
>
> config.hosts << "a620ba29.ngrok.io"

Open your `config/environments/development.rb` file add add:

```ruby
# Safelist ngrok connections to development environment.
config.hosts << /[a-z0-9]+\.ngrok\.io/
# Safelist Puma-Dev hostname.
config.hosts << 'samplerailsapp.test'
config.hosts << /[a-z0-9]+\.samplerailsapp.test/
```

This will safe-list the ngrok subdomain to access your rails host.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

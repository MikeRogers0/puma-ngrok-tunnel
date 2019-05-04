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
plugin('ngrok-tunnel') if ENV['NGROK_TUNNEL_ENABLED']
```

## Installation with puma-dev

Add the environmental variable (in a .env file for example):

```
CONFIG=config/puma.rb
```

## Usage

Read about how to configure puma to use this plugin here: https://github.com/puma/puma#plugins

There are two variables this plugin reads from the environment which control its behavior.

* `WEB_CONCURRENCY` — How many workers to run. This will be ignored on JRuby and Windows, where only 1 worker will be run.
* `MAX_THREADS` — The number of threads to run per worker. Note that this also sets the minimum number of threads to the same value, which is a recommended approach, especially in a single-app environment such as Heroku.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


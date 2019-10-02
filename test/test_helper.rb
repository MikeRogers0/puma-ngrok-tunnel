$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'simplecov'
SimpleCov.start

require 'puma'
require 'puma/plugin'
require 'puma/plugin/ngrok_tunnel'
require 'puma-ngrok-tunnel/version'
require 'minitest/autorun'

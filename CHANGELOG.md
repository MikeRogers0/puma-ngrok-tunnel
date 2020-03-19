# Changelog

## 1.0.1 (In Development)

  * Any new changes should be added to here :)

## 1.0.0

  * [Handling offline exception when connecting to Ngrok](https://github.com/MikeRogers0/puma-ngrok-tunnel/pull/13)

## 0.1.5

  * [Update rake requirement from ~> 12.3 to ~> 13.0](https://github.com/MikeRogers0/puma-ngrok-tunnel/pull/8)
  * [Adding ngrok error exception handler](https://github.com/MikeRogers0/puma-ngrok-tunnel/pull/9)
  * [Adding boilerplate gem files](https://github.com/MikeRogers0/puma-ngrok-tunnel/pull/10)
  * [Updating CI to test against latest patch versions of Ruby](https://github.com/MikeRogers0/puma-ngrok-tunnel/pull/11)

## 0.1.4

  * [Adding more ruby versions into travis CI](https://github.com/MikeRogers0/puma-ngrok-tunnel/pull/7)

## 0.1.3

  * [Update puma requirement from ~> 3.0 to >= 3, < 5](https://github.com/MikeRogers0/puma-ngrok-tunnel/pull/3)
  * [Update simplecov requirement from ~> 0.16.1 to ~> 0.17.0](https://github.com/MikeRogers0/puma-ngrok-tunnel/pull/4)

## 0.1.2

  * Setting minimum ruby version to be 2.3
  * Tided up the code with Robocop
  * Added various to the repo.

## 0.1.1

  * Improving mechanism for the tunnel being closed when rails is restarted, namely when `touch tmp/restart.txt` is used. This is based on [puma-metrics](https://github.com/harmjanblok/puma-metrics/blob/master/lib/puma/plugin/metrics.rb)
  * Adding more examples to docs.

## 0.1.0

  * Initial Release

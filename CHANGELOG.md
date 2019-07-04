# Changelog

## 0.1.3

  * Update puma requirement from ~> 3.0 to >= 3, < 5 https://github.com/MikeRogers0/puma-ngrok-tunnel/pull/3
  * Update simplecov requirement from ~> 0.16.1 to ~> 0.17.0 https://github.com/MikeRogers0/puma-ngrok-tunnel/pull/4

## 0.1.2

  * Setting minimum ruby version to be 2.3
  * Tided up the code with Robocop
  * Added various to the repo.

## 0.1.1

  * Improving mechanism for the tunnel being closed when rails is restarted, namely when `touch tmp/restart.txt` is used. This is based on [puma-metrics](https://github.com/harmjanblok/puma-metrics/blob/master/lib/puma/plugin/metrics.rb)
  * Adding more examples to docs.

## 0.1.0

  * Initial Release

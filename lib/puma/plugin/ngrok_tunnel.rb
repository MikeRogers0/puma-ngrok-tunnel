require 'ngrok/tunnel'

Puma::Plugin.create do
  def start(_dsl)
    in_background do
      puts '[puma-ngrok-tunnel] Starting'
      puts '[puma-ngrok-tunnel] Tunneling at: ' + Ngrok::Tunnel.start(options)
    end
  end

  def options
    @options = {
      addr: ENV.fetch('NGROK_ADDR') { nil } || ENV.fetch('PORT') { 3000 },
      authtoken: ENV.fetch('NGROK_AUTHTOKEN') { nil },
      host_header: ENV.fetch('NGROK_HOST_HEADER') { nil },
      config: File.join(ENV['HOME'], '.ngrok2', 'ngrok.yml'),
      subdomain: ENV.fetch('NGROK_SUBDOMAIN') { nil },
      region: ENV.fetch('NGROK_REGION') { nil },
      hostname: ENV.fetch('NGROK_HOSTNAME') { nil }
    }.reject { |_, value| value.nil? }
  end
end

at_exit do
  puts '[puma-ngrok-tunnel] Stopping'
  Ngrok::Tunnel.stop
end

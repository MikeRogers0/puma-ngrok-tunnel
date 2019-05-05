
Puma::Plugin.create do
  def start(launcher)
    puts '[puma-ngrok-tunnel] Starting'

    require 'ngrok/tunnel'
    puts '[puma-ngrok-tunnel] Tunneling at: ' + Ngrok::Tunnel.start(options)

    launcher.events.register(:state) do |state|
      if %i[halt restart stop].include?(state)
        if Ngrok::Tunnel.running?
          puts '[puma-ngrok-tunnel] Stopping'
          Ngrok::Tunnel.stop
        end
      end
    end
  end

  def options
    @options ||= {
      addr: ENV.fetch('NGROK_ADDR') { nil } || ENV.fetch('PORT') { 3000 },
      authtoken: ENV.fetch('NGROK_AUTHTOKEN') { nil },
      host_header: ENV.fetch('NGROK_HOST_HEADER') { nil },
      config: ENV.fetch('NGROK_CONFIG') { File.join(ENV['HOME'], '.ngrok2', 'ngrok.yml') },
      subdomain: ENV.fetch('NGROK_SUBDOMAIN') { nil },
      region: ENV.fetch('NGROK_REGION') { nil },
      hostname: ENV.fetch('NGROK_HOSTNAME') { nil }
    }.reject { |_, value| value.nil? }
  end
end

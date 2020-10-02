require 'ngrok/tunnel'

Puma::Plugin.create do
  def start(launcher)
    puts '[puma-ngrok-tunnel] Starting'

    launcher.events.register(:state) do |state|
      ngrok_stop! if %i[halt restart stop].include?(state)
    end

    ngrok_start!
  end

  private

  def ngrok_start!
    puts "[puma-ngrok-tunnel] Tunneling at: #{Ngrok::Tunnel.start(options)}"
  rescue Ngrok::FetchUrlError => e
    puts "[puma-ngrok-tunnel] Unable connect to ngrok server (You might be offline): #{e}"
  rescue Ngrok::Error => e
    puts "[puma-ngrok-tunnel] Unable to start tunnel (You might have another active connection): #{e}"
  end

  def ngrok_stop!
    return unless Ngrok::Tunnel.running?

    puts '[puma-ngrok-tunnel] Stopping'
    Ngrok::Tunnel.stop
  end

  def options
    @options ||= {
      addr: ENV.fetch('NGROK_ADDR', nil) || ENV.fetch('PORT', 3000),
      authtoken: ENV.fetch('NGROK_AUTHTOKEN', nil),
      host_header: ENV.fetch('NGROK_HOST_HEADER', nil),
      config: ENV.fetch('NGROK_CONFIG') { File.join(ENV['HOME'], '.ngrok2', 'ngrok.yml') },
      subdomain: ENV.fetch('NGROK_SUBDOMAIN', nil),
      region: ENV.fetch('NGROK_REGION', nil),
      hostname: ENV.fetch('NGROK_HOSTNAME', nil)
    }.reject { |_, value| value.nil? }
  end
end

Puma::Plugin.create do
  def start(_launcher)
    require 'ngrok/tunnel'
    options = {
      addr: ENV.fetch('PORT') { 3000 },
      authtoken: ENV.fetch('NGROK_AUTHTOKEN') { nil },
      host_header: ENV.fetch('NGROK_HOST_HEADER') { nil },
      config: File.join(ENV['HOME'], '.ngrok2', 'ngrok.yml'),
      subdomain: ENV.fetch('NGROK_SUBDOMAIN') { nil },
      region: ENV.fetch('NGROK_REGION') { nil },
      hostname: ENV.fetch('NGROK_HOSTNAME') { nil }
    }.reject { |_, value| value.blank? }

    puts '[NGROK] tunneling at ' + Ngrok::Tunnel.start(options)
  end
end

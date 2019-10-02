# frozen_string_literal: true

require 'test_helper'

class PluginTest < Minitest::Test
  def test_plugin_has_version
    assert(!PumaNgrokTunnel::VERSION.nil?, 'Ngrok Tunnel has a version number')
  end

  def test_plugin_is_registered
    assert(!Puma::Plugins.find('ngrok_tunnel').nil?, 'Ngrok Tunnel is a registered puma plugin')
  end
end

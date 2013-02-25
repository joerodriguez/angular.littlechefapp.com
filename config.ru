require 'brochure'
require 'coffee_script'
require 'rack/reverse_proxy'

use Rack::ReverseProxy do
  # Set :preserve_host to true globally (default is true already)
  reverse_proxy_options :preserve_host => true

  # Forward the path /foo/* to http://example.com/bar/*
  reverse_proxy /^\/api(\/.*)$/, 'http://www.littlechefapp.com$1'
end

run Brochure.app(File.dirname(__FILE__))


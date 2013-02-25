require "brochure"
require 'coffee_script'

class ApiProxy

  def initialize(app)
    @app = app
  end

  def call(env)
    original_host = env["HTTP_HOST"]
    rewrite_env(env)
    if env["HTTP_HOST"] != original_host
      perform_request(env)
    else
      @app.call(env)
    end
  end

  def rewrite_env(env)
    request = Rack::Request.new(env)
    if request.path[/^\/api/]
      env["HTTP_HOST"] = "www.littlechefapp.com"
      env["REQUEST_URI"].gsub! '/api', ''
      env["PATH_INFO"].gsub! '/api', ''
      env["REQUEST_PATH"].gsub! '/api', ''
      env["REQUEST_URI"] = "http://#{env['HTTP_HOST']}#{env['REQUEST_PATH']}"
      env["SERVER_NAME"] = "www.littlechefapp.com"
    end
    env
  end
end

require 'rack/reverse_proxy'

use Rack::ReverseProxy do
  # Set :preserve_host to true globally (default is true already)
  reverse_proxy_options :preserve_host => true

  # Forward the path /foo/* to http://example.com/bar/*
  reverse_proxy /^\/api(\/.*)$/, 'http://www.littlechefapp.com$1'
end

run Brochure.app(File.dirname(__FILE__))


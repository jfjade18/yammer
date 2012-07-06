require 'faraday'

module Faraday
  class Request::YammerOAuth2 < Faraday::Middleware
    dependency 'simple_oauth'

    def call(env)
      env[:request_headers]['Authorization'] = "Bearer #{@options[:token]}" if @options[:token]
      @app.call(env)
    end

    def initialize(app, options)
      @app, @options = app, options
    end
  end
end

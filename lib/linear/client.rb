# frozen_string_literal: true

require "graphlient"
require_relative "concerns/elevated_singleton"

module Linear
  class Client < Graphlient::Client
    include ElevatedSingleton

    def initialize
      super(
        Linear.config.uri,
        schema_path: Linear.config.schema_path,
        headers: headers,
        http_options: http_options
      )

      schema.dump!
    end

    def headers
      Linear.config.headers.merge(
        "Content-Type" => "application/json",
        "User-Agent" => "Linear SDK Ruby",
        "Authorization" => Linear.config.api_key
      )
    end

    def http_options
      {
        read_timeout: Linear.config.read_timeout,
        write_timeout: Linear.config.write_timeout
      }
    end
  end
end

# frozen_string_literal: true

require "graphlient"
require "singleton"

module Linear
  class Client < Graphlient::Client
    include Singleton

    def self.method_missing(method_name, ...)
      return super unless respond_to_missing?(method_name)

      instance.public_send(method_name, ...)
    end

    def self.respond_to_missing?(method_name, *)
      return true if instance.respond_to?(method_name)

      super
    end

    def initialize
      super(
        Linear.config.uri,
        schema_path: Linear.config.schema_path,
        headers: Linear.config.headers.merge(
          "Authorization" => Linear.config.api_key
        ),
        http_options: {
          read_timeout: Linear.config.read_timeout,
          write_timeout: Linear.config.write_timeout
        }
      )

      schema.dump!
    end
  end
end

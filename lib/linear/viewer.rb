# frozen_string_literal: true

require_relative "client"

module Linear
  class Viewer
    QUERY = <<~GRAPHQL
      query {
        viewer {
          id
          name
          email
        }
      }
    GRAPHQL

    class << self
      def response
        @__response ||= Linear::Client.query(QUERY)
      end

      def instance
        response.data.send(name.demodulize.underscore)
      end
    end

    def name
      instance.name
    end

    def email
      instance.email
    end
  end
end

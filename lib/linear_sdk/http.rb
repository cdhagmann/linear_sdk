# frozen_string_literal: true

require "graphql/client/http"

module LinearSDK
  HTTP = GraphQL::Client::HTTP.new("https://api.linear.app/graphql") do
    def headers(_context)
      {
        "User-Agent": "My Client",
        "Content-Type": "application/json",
        Authorization: LinearSDK.config.api_key
      }
    end
  end
end

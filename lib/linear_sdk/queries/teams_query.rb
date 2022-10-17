# frozen_string_literal: true

require "linear_sdk/client"

module LinearSDK
  module Queries
    TeamsQuery = LinearSDK::Client.parse <<-'GRAPHQL'
      query {
        teams {
          nodes {
            id
            name
          }
        }
      }
    GRAPHQL
  end
end

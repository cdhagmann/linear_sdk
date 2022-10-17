# frozen_string_literal: true

require "linear_sdk/client"

module LinearSDK
  module Queries
    ViewerQuery = LinearSDK::Client.parse <<-'GRAPHQL'
      query {
        viewer {
          id
          name
          email
        }
      }
    GRAPHQL
  end
end

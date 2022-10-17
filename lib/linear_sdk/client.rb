# frozen_string_literal: true

require_relative "schema"
require_relative "http"

module LinearSDK
  Client = GraphQL::Client.new(
    schema: LinearSDK::Schema,
    execute: LinearSDK::HTTP
  )
end

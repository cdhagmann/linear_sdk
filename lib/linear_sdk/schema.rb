# frozen_string_literal: true

require "graphql/client"
require_relative "http"

module LinearSDK
  Schema = GraphQL::Client.load_schema(LinearSDK::HTTP)
end

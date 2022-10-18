# frozen_string_literal: true

require "dry-configurable"

module Linear
  extend Dry::Configurable

  setting(
    :uri,
    default: -"https://api.linear.app/graphql",
    reader: true
  )

  setting(
    :api_key,
    default: -"",
    reader: true
  )

  setting(
    :schema_path,
    default: -"config/schema.json",
    reader: true
  )

  setting(
    :headers,
    default: {},
    reader: true
  )

  setting(
    :read_timeout,
    default: 20,
    reader: true
  )

  setting(
    :write_timeout,
    default: 30,
    reader: true
  )
end

require_relative "linear/version"
require_relative "linear/client"
require_relative "linear/schema"

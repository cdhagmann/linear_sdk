# frozen_string_literal: true
# frozen_string_literal: true

require "dry-configurable"

module LinearSDK
  extend Dry::Configurable

  setting(:api_key, default: "", reader: true)
  setting(:team_id, default: "", reader: true)
end

require_relative "linear_sdk/version"
require_relative "linear_sdk/http"
require_relative "linear_sdk/schema"
require_relative "linear_sdk/client"

require_relative "linear_sdk/queries"
require_relative "linear_sdk/mutations"

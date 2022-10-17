# frozen_string_literal: true

require "linear_sdk/client"

module LinearSDK
  module Mutations
    IssueCreateMutation = LinearSDK::Client.parse <<-'GRAPHQL'
    mutation IssueCreate {
        issueCreate(
          input: {
            title: $title
            description: $description
            teamId: $team_id
          }
        )
      }
    GRAPHQL
  end
end


# LinearSDK::Client.create_operation(
#   LinearSDK::Mutations::IssueCreateMutation,
#   variables: {
#     title: "JEDI",
#     description: "TEST",
#     team_id: LinearSDK.config.team_id
#   }
# )

# frozen_string_literal: true

require_relative "client"

module Linear
  class Team
    QUERY_ALL = <<~GRAPHQL
      query {
        teams {
          nodes {
            id
            name
          }
        }
      }
    GRAPHQL

    class << self
      def all
        response.data.teams.nodes.map do |node|
          new(node.id, node.name)
        end
      end

      private def response
        @_response ||= Linear::Client.query(QUERY_ALL)
      end
    end

    attr_reader :id, :name

    def initialize(id, name)
      @id = id
      @name = name
    end

    def query
      <<~GRAPHQL
        query {
          team(id: "#{id}") {
            id
            name

            issues {
              nodes {
                id
                title
                description
                assignee {
                  id
                  name
                }
                createdAt
                archivedAt
              }
            }
          }
        }
      GRAPHQL
    end

    def issues
      Linear::Client.query(query).data.team.issues.nodes.map do |node|
        Linear::Issue.new(node.id)
      end
    end
  end
end

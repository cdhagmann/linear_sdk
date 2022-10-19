# frozen_string_literal: true

require_relative "client"

module Linear
  class Issue
    QUERY_ALL = <<~GRAPHQL
      query {
        issues {
          nodes {
            id
            title
          }
        }
      }
    GRAPHQL

    QUERY = <<~GRAPHQL
      query {
        issue(id: "#{id}") {
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

    class << self
      def all
        response.data.issues.nodes.map do |node|
          new(node.id, node.title)
        end
      end

      def find(id)
        query = <<~GRAPHQL
          query {
            issue(id: "#{id}") {
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
        GRAPHQL

        Linear::Client.query(query).data.issue.then do |issue|
          new(issue.id)
        end
      end

      private def response
        @_response ||= Linear::Client.query(QUERY_ALL)
      end
    end

    attr_reader :id, :title

    def initialize(id, title)
      @id = id
      @name = title
    end

    def query
      <<~GRAPHQL
        query {
          issue(id: "#{id}") {
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
  end
end

# keys = Linear::Team.all.first.foo.data.team.issues.nodes.first.inspect.split[1..]

# buffer = ""
# attributes = []

# keys.select { |key| key.include?("=") }.map{ |key| key.split("=").first }
#   buffer += key
#   if key.include?("=")
#     buffer.split("=")

#   end

# end

#   def attributes(object)
#     object.inspect.split
#       .select { |key| key.include?("=") }
#       .map{ |key| key.split("=").first.underscore }
#   end

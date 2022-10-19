# frozen_string_literal: true

require "singleton"
require "active_support/concern"

module Linear
  module ElevatedSingleton
    extend ActiveSupport::Concern

    included do
      include Singleton
    end

    class_methods do
      def method_missing(method_name, ...)
        return super unless respond_to_missing?(method_name)

        instance.public_send(method_name, ...)
      end

      def respond_to_missing?(method_name, *)
        return true if instance.respond_to?(method_name)

        super
      end

      def reload!
        Singleton.__init__(self)
      end
    end
  end
end

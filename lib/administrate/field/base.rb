require_relative "deferred"
require "active_support/core_ext/string/inflections"

module Administrate
  module Field
    class Base
      def self.with_options(options = {})
        Deferred.new(self, options)
      end

      def self.html_class
        field_type.dasherize
      end

      def self.searchable?
        false
      end

      def initialize(attribute, data, page, resource, options = {})
        @attribute = attribute
        @data = data
        @page = page
        @resource = resource
        @options = options
      end

      def self.permitted_attribute(attr)
        attr
      end

      def html_class
        self.class.html_class
      end

      def name
        attribute.to_s
      end

      def readonly?
        options.fetch(:readonly, false)
      end

      def required?
        options.fetch(:required, false)
      end

      def reorder_action
        options.fetch(:reorder_action, false)
      end

      def upload_action
        options.fetch(:upload_action, false)
      end

      def action_links
        options.fetch(:action_links, [])
      end

      def to_partial_path
        "/fields/#{self.class.field_type}/#{page}"
      end

      attr_reader :attribute, :data, :page, :resource

      protected

      attr_reader :options

      def self.field_type
        to_s.split("::").last.underscore
      end
    end
  end
end

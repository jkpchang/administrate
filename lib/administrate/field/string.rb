require_relative "base"

module Administrate
  module Field
    class String < Field::Base
      def self.searchable?
        true
      end

      def valid_values
        options.fetch(:valid_values, nil)
      end

      def maxlength
        options.fetch(:maxlength, nil)
      end

      def truncate
        return data.to_s.truncate(truncation_length)
      end

      private

      def truncation_length
        options.fetch(:truncate, 50)
      end
    end
  end
end

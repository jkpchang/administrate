require_relative "base"

module Administrate
  module Field
    class FontPicker < Field::Base
      def self.searchable?
        false
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

require_relative "base"

module Administrate
  module Field
    class Number < Field::Base
      def to_s
        if data.nil?
          "-"
        else
          format_string % data
        end
      end

      private

      def format_string
        if currency?
          helper.number_to_currency(data, :precision => decimals)
        else
          prefix + "%.#{decimals}f"
        end
      end

      def currency?
        options.fetch(:is_currency, false)
      end

      def prefix
        options[:prefix].to_s
      end

      def decimals
        options.fetch(:decimals, 0)
      end

      private

      def helper
        @helper ||= Class.new do
          include ActionView::Helpers::NumberHelper
        end.new
      end

    end
  end
end

require_relative "base"

module Administrate
  module Field
    class Percentage < Administrate::Field::Base
      def to_s
        helper.number_to_percentage(data, :precision => 1)
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

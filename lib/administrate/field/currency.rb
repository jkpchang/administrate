require_relative "base"

module Administrate
  module Field
    class Currency < Administrate::Field::Base
      def to_s
        helper.number_to_currency(data, :precision => 2)
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

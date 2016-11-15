require_relative "base"

module Administrate
  module Field
    class Date < Base
      def format
        options.fetch(:format, nil)
      end
    end
  end
end

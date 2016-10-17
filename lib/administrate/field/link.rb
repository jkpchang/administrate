require_relative "base"

module Administrate
  module Field
    class Link < Field::String
      def link_label
        options.fetch(:link_label, "Link")
      end
      def target
        options.fetch(:target, "_blank")
      end
    end
  end
end

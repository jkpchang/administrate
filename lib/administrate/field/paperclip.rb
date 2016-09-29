require_relative "base"

module Administrate
  module Field
    class Paperclip < Administrate::Field::Base

      def url
        data.url
      end

      def thumbnail
        data.url(:thumb)
      end

      def to_s
        data
      end
    end
  end
end

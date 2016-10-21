require_relative "base"

module Administrate
  module Field
    class Paperclip < Administrate::Field::Base

      def url
        data.url
      end

      def thumbnail_url
        data.url(:thumb)
      end

      def content_type
        data.content_type
      end

      def image?
        return !(self.content_type =~ /^image/).nil?
      end

    end
  end
end

require "administrate/field/belongs_to"
require "administrate/field/boolean"
require "administrate/field/date_time"
require "administrate/field/date"
require "administrate/field/email"
require "administrate/field/has_many"
require "administrate/field/has_one"
require "administrate/field/number"
require "administrate/field/polymorphic"
require "administrate/field/select"
require "administrate/field/string"
require "administrate/field/text"
require "administrate/field/color_picker"
require "administrate/field/font_picker"
require "administrate/field/html_tinymce"
require "administrate/field/divider"
require "administrate/field/currency"
require "administrate/field/percentage"
require "administrate/field/paperclip"
require "administrate/field/password"
require "administrate/field/link"

module Administrate
  class BaseDashboard
    include Administrate

    GLOBAL_ATTRIBUTE_TYPES = {
        divider: Field::Divider
    }

    def attribute_types
      self.class::GLOBAL_ATTRIBUTE_TYPES.merge(self.class::ATTRIBUTE_TYPES)
    end

    def attribute_type_for(attribute_name)
      attribute_types.fetch(attribute_name) do
        fail attribute_not_found_message(attribute_name)
      end
    end

    def attribute_types_for(attribute_names)
      attribute_names.each_with_object({}) do |name, attributes|
        attributes[name] = attribute_type_for(name)
      end
    end

    def form_attributes
      self.class::FORM_ATTRIBUTES
    end

    def new_form_attributes
      if defined?(self.class::NEW_FORM_ATTRIBUTES)
        self.class::NEW_FORM_ATTRIBUTES
      else
        self.class::FORM_ATTRIBUTES
      end
    end

    def permitted_attributes
      (form_attributes + new_form_attributes).map do |attr|
        attribute_types[attr].permitted_attribute(attr)
      end.uniq
    end

    def show_page_attributes
      self.class::SHOW_PAGE_ATTRIBUTES
    end

    def collection_attributes
      self.class::COLLECTION_ATTRIBUTES
    end

    def display_resource(resource)
      "#{resource.class} ##{resource.id}"
    end

    def pundit_scope?
      defined?(self.class::PUNDIT_SCOPE) and self.class::PUNDIT_SCOPE == true
    end

    private

    def attribute_not_found_message(attr)
      "Attribute #{attr} could not be found in #{self.class}::ATTRIBUTE_TYPES"
    end
  end
end

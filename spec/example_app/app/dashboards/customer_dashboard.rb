require "administrate/base_dashboard"

class CustomerDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    created_at: Field::DateTime,
    email: Field::Email,
    email_subscriber: Field::Boolean,
    lifetime_value: Field::Number.with_options(prefix: "$", decimals: 2),
    name: Field::String,
    orders: Field::HasMany,
    updated_at: Field::DateTime,
    kind: Field::Select.with_options(collection: Customer::KINDS),
    favorite_color: Field::ColorPicker,
    favorite_font: Field::FontPicker
  }

  COLLECTION_ATTRIBUTES = ATTRIBUTE_TYPES.keys
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys - [:name]
  FORM_ATTRIBUTES = [
    :name,
    :email,
    :email_subscriber,
    :kind,
    :favorite_color,
    :favorite_font
  ].freeze

  def display_resource(customer)
    customer.name
  end
end

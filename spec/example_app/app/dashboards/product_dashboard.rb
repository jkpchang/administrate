require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :name,
    :price,
    :description,
    :image_url,
    :features
  ]

  ATTRIBUTE_TYPES = {
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::Text,
    image_url: Field::String,
    name: Field::String,
    price: Field::Currency,
    features: Field::HtmlTinymce
  }

  COLLECTION_ATTRIBUTES = [
      :name,
      :price,
      :description,
      :image_url,
      :features
  ]
  FORM_ATTRIBUTES = ATTRIBUTES
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTES

  def display_resource(resource)
    resource.name
  end
end
